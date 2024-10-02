import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/warning_message.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../cubit/info_form_cubit.dart';
import '../../../../cubit/info_form_first_cubit.dart';
import '../model/info_first_model.dart';
import 'next_form_button.dart';

class InfoFormFirst extends StatelessWidget {
  const InfoFormFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoFormFirstCubit, InfoFormFirstModel>(
      builder: (context, state) {
        final List<Map<String, dynamic>> fields = [
          {
            "hintText": "Участник(ца) процесса, прошедший(ая) беседу: ФИО",
            "keyboardType": TextInputType.text,
            "hasDropdown": false,
            "value": state.participantFullName,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateFullName(value);
            },
          },
          {
            "hintText": "Место проживания",
            "keyboardType": TextInputType.text,
            "hasDropdown": false,
            "value": state.placeOfResidence,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updatePlaceOfResidence(value);
            },
          },
          {
            "hintText": "Номер телефона",
            "keyboardType": TextInputType.phone,
            "hasDropdown": false,
            "value": state.phoneNumber,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updatePhoneNumber(value);
            },
          },
          {
            "hintText": "Выберите Статус участника(цы) процесса",
            "hasDropdown": true,
            "options": [
              "Участник",
              "Собеседник",
              "Офицер",
              "Подполковник",
              "Полковник",
              "Сержант",
            ],
            "value": state.participantStatus,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateParticipantStatus(value);
            },
          },
          // Add other fields in a similar manner
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: fields.map((field) {
            return GlobalTextField(
              hintText: field["hintText"],
              keyboardType: field["keyboardType"] ?? TextInputType.text,
              hasDropdown: field["hasDropdown"] ?? false,
              readOnly: field["readOnly"] ?? false,
              hasCalendar: field["hasCalendar"] ?? false,
              options: field["options"] ?? [],
              initialValue: field["value"],
              onChanged: field["onChanged"],
            );
          }).toList(),
        );
      },
    );
  }
}
