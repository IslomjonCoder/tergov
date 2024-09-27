import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
import '../../../../../../../utils/constants/colors.dart';


class InfoForm extends StatelessWidget {
  const InfoForm({super.key});

  @override
  Widget build(BuildContext context) {
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
        const GlobalTextField(
          hintText: "Участник(ца) процесса, прошедший(ая) беседу: ФИО",
        ),
        const GlobalTextField(hintText: "Место проживания"),
        const GlobalTextField(
          hintText: "Номер телефона",
          keyboardType: TextInputType.phone,
        ),
        const GlobalTextField(
          hintText: "Выберите Статус участника(цы) процесса",
        ),
        const GlobalTextField(hintText: "Беседа проведена"),
        const GlobalTextField(
          hintText: "Начальник следственного отделения,проводивший беседу: ФИО",
        ),
        const GlobalTextField(
          hintText: "Сотрудник, проводивший доследственную проверку,дознание или расследование: ФИО",
        ),
        const GlobalTextField(
          hintText: "СВ ходе беседы разъяснено содержание статьи 211Уголовного кодекса Республики Узбекистан",
        ),
        const GlobalTextField(hintText: "Процесс собеседования видеозаписью"),
        const GlobalTextField(hintText: "Дата беседы"),
        Gap(MediaQuery.of(context).size.width * 0.05),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: TColors.text006,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Далее",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}