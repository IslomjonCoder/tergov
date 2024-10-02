import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
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
            "hintText": "Имели ли место со стороны сотрудника следующие факты?",
            "hasDropdown": true,
            "value": state.employeeFacts,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updateEmployeeFacts(value);
            },
          },
          {
            "hintText": "Длительные беспричинные ожидания",
            "hasDropdown": false,
            "value": state.longWaits,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updateLongWaits(value);
            },
          },
          {
            "hintText": "Грубое обращение",
            "hasDropdown": false,
            "value": state.rudeBehavior,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updateRudeBehavior(value);
            },
          },
          {
            "hintText": "Психологическое давление",
            "hasDropdown": false,
            "value": state.psychologicalPressure,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updatePsychologicalPressure(value);
            },
          },
          {
            "hintText": "Физическое давление",
            "hasDropdown": true,
            "readOnly": true,
            "options": ["Да", "Нет"],
            "value": state.physicalPressure,
            "onChanged": (String value) {
              context.read<InfoFormSecondCubit>().updatePhysicalPressure(value);
            },
          },
          {
            "hintText": "Вымогательство незаконного вознаграждения",
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
            const Text(
              "Ваше соглашение",
              style: TextStyle(
                fontSize: 32,
                color: TColors.text006,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(20),
            ...fields.map((field) {
              return GlobalTextField(
                hintText: field["hintText"],
                hasDropdown: field["hasDropdown"] ?? false,
                readOnly: field["readOnly"] ?? false,
                options: field["options"] ?? [],
                initialValue: field["value"],
                onChanged: field["onChanged"],
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
