import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:tergov/features/dashboard/data/models/participant_model.dart';
import 'package:tergov/features/user/home/cubit/info_form_first_cubit.dart';
import 'package:tergov/features/user/home/cubit/info_form_second_cubit.dart';
import 'package:tergov/features/user/home/presentation/manager/participant_upload_cubit.dart';
import 'package:tergov/utils/helpers/pdf_helper.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../cubit/info_form_cubit.dart';

class NextFormButton extends StatelessWidget {
  final String title;

  const NextFormButton({
    super.key,
    required this.title,
  });

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
                context.read<FormCubit>().toggleForm();
              } else {
                final participant = Participant.fromInfoForms(
                  firstModel: context.read<InfoFormFirstCubit>().state,
                  secondModel: context.read<InfoFormSecondCubit>().state,
                  interviewStartDate: DateTime.now(),
                );
                final pdfFile = await PdfHelper.generatePdf(participant);
                await OpenFile.open(pdfFile.path);
              }
            },
            child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
