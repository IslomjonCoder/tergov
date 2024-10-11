import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/features/dashboard/data/models/participant_roles.dart';
import 'package:tergov/features/user/home/cubit/info_form_first_cubit.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/model/info_first_model.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
import 'package:tergov/utils/constants/enums.dart';

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
            "readOnly": true,
            "options": [
              "Айбланувчи / Обвиняемый",
              "Қонуний вакил / Законный представитель",
              "Қариндош / Родственник",
              "Бошқа иштирокчи / Другой участник процесса",
            ],
            "value": state.participantRole?.roleName,
            "onChanged": (ParticipantRole value) {
              context.read<InfoFormFirstCubit>().updateParticipantStatus(value);
            },
          },
          {
            "hintText": "Беседа проведена",
            "hasDropdown": true,
            "readOnly": true,
            "options": [
              "Xa/Да",
              "Yo'q/Нет",
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
            "readOnly": true,
            "options": [
              "Xa/Да",
              "Yo'q/Нет",
            ],
            "value": state.article211Explanation,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateArticle211Explanation(value);
            },
          },
          {
            "hintText": "Процесс собеседования видеозаписью",
            "hasDropdown": true,
            "readOnly": true,
            "options": [
              YesNo.yes.name,
              YesNo.no.name,
            ],
            "value": state.interviewRecorded,
            "onChanged": (String value) {
              context.read<InfoFormFirstCubit>().updateInterviewRecorded(value);
            },
          },
          {
            "hintText": "Дата беседы",
            "readOnly": true,
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
              controller: TextEditingController(),
              onChanged: field["onChanged"],
            );
          }).toList(),
        );
      },
    );
  }
}
