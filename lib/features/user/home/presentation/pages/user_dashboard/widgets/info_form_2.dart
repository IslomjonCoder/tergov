import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
import '../../../../../../../utils/constants/colors.dart';
import 'next_form_button.dart';

class InfoFormSecond extends StatelessWidget {
  const InfoFormSecond({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of fields to simplify creation
    final List<Map<String, dynamic>> fields = [
      {
        "hintText": "Имели ли место со стороны сотрудника следующие факты?",
        "hasDropdown": true,
      },
      {
        "hintText": "Длительные беспричинные ожидания",
        "hasDropdown": false,
      },
      {
        "hintText": "Грубое обращение",
        "hasDropdown": false,
      },
      {
        "hintText": "Психологическое давление",
        "hasDropdown": false,
      },
      {
        "hintText": "Физическое давление",
        "hasDropdown": true,
        "readOnly": true,
        "options": ["Да", "Нет"],
      },
      {
        "hintText": "Вымогательство незаконного вознаграждения",
        "hasDropdown": true,
        "readOnly": true,
        "options": ["Да", "Нет"],
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
          );
        }).toList(),
      ],
    );
  }
}
