import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../cubit/info_form_second_cubit.dart';
import '../model/info_form_second_model.dart';

class InfoFormSecond extends StatelessWidget {
  const InfoFormSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoFormSecondCubit, InfoFormSecondModel>(
      builder: (context, state) {
        final List<Map<String, dynamic>> fields = [
          {
            "hintText": S.of(context).misconductOccurred,
            "hasDropdown": true,
            "value": state.employeeFacts,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updateEmployeeFacts(value);
            },
          },
          {
            "hintText": S.of(context).longWaiting,
            "hasDropdown": false,
            "value": state.longWaits,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updateLongWaits(value);
            },
          },
          {
            "hintText": S.of(context).rudeBehavior,
            "hasDropdown": false,
            "value": state.rudeBehavior,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updateRudeBehavior(value);
            },
          },
          {
            "hintText": S.of(context).psychologicalPressure,
            "hasDropdown": false,
            "value": state.psychologicalPressure,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updatePsychologicalPressure(value);
            },
          },
          {
            "hintText": S.of(context).physicalPressure,
            "hasDropdown": true,
            "readOnly": true,
            "options": ["Да", "Нет"],
            "value": state.physicalPressure,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updatePhysicalPressure(value);
            },
          },
          {
            "hintText": S.of(context).bribery,
            "hasDropdown": true,
            "readOnly": true,
            "options": ["Да", "Нет"],
            "value": state.extortion,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updateExtortion(value);
            },
          },
        ];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              S.of(context).yourConsent,
              style: const TextStyle(
                fontSize: 32,
                color: TColors.text006,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(20),
            ...fields.map((field) {
              return GlobalTextField(
                hintText: field["hintText"],
                keyboardType: field["keyboardType"] ?? TextInputType.text,
                hasDropdown: field["hasDropdown"] ?? false,
                readOnly: field["readOnly"] ?? false,
                hasCalendar: field["hasCalendar"] ?? false,
                options: field["options"] ?? [],
                controller: TextEditingController(text: field["value"]),
                onChanged: field["onChanged"],
              );
            }),
          ],
        );
      },
    );
  }
}
