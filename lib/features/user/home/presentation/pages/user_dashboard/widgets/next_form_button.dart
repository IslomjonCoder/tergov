import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:tergov/features/dashboard/data/models/participant_model.dart';
import 'package:tergov/features/user/home/cubit/info_form_cubit.dart';
import 'package:tergov/features/user/home/cubit/info_form_first_cubit.dart';
import 'package:tergov/features/user/home/cubit/info_form_second_cubit.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/helpers/pdf_helper.dart';

class NextFormButton extends StatelessWidget {
  const NextFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<FormCubit, bool>(
        builder: (context, state) {
          return FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: TColors.text006,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            ),
            onPressed: () async {
              if (state) {
                if (context.read<InfoFormFirstCubit>().formKey.currentState!.validate()) {
                  context.read<FormCubit>().toggleForm();
                }
              } else {
                if (context.read<InfoFormSecondCubit>().formKey.currentState!.validate()) {
                  final participant = Participant.fromInfoForms(
                    firstModel: context.read<InfoFormFirstCubit>().build(),
                    secondModel: context.read<InfoFormSecondCubit>().build(),
                    interviewStartDate: DateTime.now(),
                  );
                  final pdfFile = await PdfHelper.generatePdf(participant);
                  await OpenFile.open(pdfFile.path);
                }
              }
            },
            child: Text(
              context.watch<FormCubit>().state ? 'Далее' : "Отправить",
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
