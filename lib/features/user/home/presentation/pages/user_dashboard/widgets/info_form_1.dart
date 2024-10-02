import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
import '../../../../cubit/info_form_first_cubit.dart';
import '../model/info_first_model.dart';

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
          {
            "hintText": "Беседа проведена",
            "hasDropdown": true,
            "options": [
              "Да",
              "Нет",
            ],
            "value": state.interviewConducted,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateInterviewConducted(value);
            },
          },
          {
            "hintText": "Начальник следственного отделения,проводивший беседу: ФИО",
            "value": state.investigatorFullName,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateInvestigatorFullName(value);
            },
          },
          {
            "hintText": "Сотрудник, проводивший доследственную проверку,дознание или расследование: ФИО",
            "value": state.officerFullName,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateOfficerFullName(value);
            },
          },
          {
            "hintText": "В ходе беседы разъяснено содержание статьи 211Уголовного кодекса Республики Узбекистан",
            "hasDropdown": true,
            "options": [
              "Да",
              "Нет",
            ],
            "value": state.article211Explanation,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateArticle211Explanation(value);
            },
          },
          {
            "hintText": "Процесс собеседования видеозаписью",
            "hasDropdown": true,
            "options": [
              "Да",
              "Нет",
            ],
            "value": state.interviewRecorded,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateInterviewRecorded(value);
            },
          },
          {
            "hintText": "Дата беседы",
            "hasCalendar": true,
            "value": state.interviewStartDate,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateInterviewStartDate(value);
            },
          },
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
              controller: TextEditingController(text: field["value"]),
              onChanged: field["onChanged"],
            );
          }).toList(),
        );
      },
    );
  }
}
