import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/warning_message.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../cubit/info_form_cubit.dart';
import 'next_form_button.dart';

class InfoFormFirst extends StatelessWidget {
  const InfoFormFirst({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> fields = [
      {
        "hintText": "Участник(ца) процесса, прошедший(ая) беседу: ФИО",
        "keyboardType": TextInputType.text,
        "hasDropdown": false,
      },
      {
        "hintText": "Место проживания",
        "keyboardType": TextInputType.text,
        "hasDropdown": false,
      },
      {
        "hintText": "Номер телефона",
        "keyboardType": TextInputType.phone,
        "hasDropdown": false,
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
      },
      {
        "hintText": "Беседа проведена",
        "hasDropdown": true,
        "readOnly": true,
        "options": ["Да", "Нет"],
      },
      {
        "hintText": "Начальник следственного отделения, проводивший беседу: ФИО",
        "keyboardType": TextInputType.text,
        "hasDropdown": false,
      },
      {
        "hintText": "Сотрудник, проводивший доследственную проверку, дознание или расследование: ФИО",
        "hasDropdown": true,
        "options": [
          "Абдуллаев Мухаммадхонович Нуриддин",
          "Хошимов Мухаммадхонич Азамат",
        ],
      },
      {
        "hintText": "СВ ходе беседы разъяснено содержание статьи 211 Уголовного кодекса Республики Узбекистан",
        "hasDropdown": true,
        "readOnly": true,
        "options": ["Да", "Нет"],
      },
      {
        "hintText": "Процесс собеседования видеозаписью",
        "hasDropdown": true,
        "readOnly": true,
        "options": ["Да", "Нет"],
      },
      {
        "hintText": "Дата начала беседы",
        "keyboardType": TextInputType.datetime,
        "readOnly": true,
        "hasCalendar": true,
      },
      {
        "hintText": "Дата беседы",
        "readOnly": true,
        "hasCalendar": true,
      },
    ];

    return BlocBuilder<FormCubit, bool>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Основная информация",
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
                keyboardType: field["keyboardType"] ?? TextInputType.text,
                hasDropdown: field["hasDropdown"] ?? false,
                readOnly: field["readOnly"] ?? false,
                hasCalendar: field["hasCalendar"] ?? false,
                options: field["options"] ?? [],
              );
            }).toList(),

          ],
        );
      },
    );
  }
}