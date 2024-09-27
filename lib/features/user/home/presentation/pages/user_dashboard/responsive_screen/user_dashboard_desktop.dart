import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
import 'package:tergov/utils/constants/sizes.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../widgets/step_part.dart';
import '../widgets/warning_container.dart';

class UserDashboardDesktop extends StatelessWidget {
  const UserDashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage(),
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Gap(150), // Increase gap for desktop layout
                InfoCard(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Align widgets to top for desktop layout
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: InfoForm()),
                        Gap(TSizes.lg),
                        StepPart(),
                      ],
                    ),
                  ),
                ),
                Gap(50),
                WarningMessage(),
                Gap(50),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/user_back.png",
      fit: BoxFit.cover,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      alignment: Alignment.topCenter,
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InfoCardTemplate(child: child);
  }
}

class InfoCardTemplate extends StatelessWidget {
  const InfoCardTemplate({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      // Limit max width for large desktop screens
      margin: const EdgeInsets.symmetric(horizontal: 200, vertical: 100),
      padding: const EdgeInsets.all(32),
      // Increased padding for desktop
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: TColors.white,
        boxShadow: [
          BoxShadow(
            color: TColors.primary.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(5, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}

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
            // Slightly increased font size for desktop readability
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
        const Gap(80.0),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: TColors.text006,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 25, // Increased padding for larger screens
                vertical: 20,
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Далее",
              style: TextStyle(fontSize: 18), // Increased font size for readability
            ),
          ),
        ),
      ],
    );
  }
}

class WarningMessage extends StatelessWidget {
  const WarningMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 150),
      // Wider padding for desktop view
      child: WarningContainer(
        title:
            "Мне разъяснено о том, что дача взятки, то есть заведомо незаконное предоставление должностному лицу государственного органа, организации с государственным участием или органа самоуправления граждан лично или через посредника материальных ценностей или имущественной выгоды за выполнение или невыполнение в интересах давшего взятку определенного действия, которое должностное лицо должно было или могло совершить с использованием своего служебного положения, предусматривает уголовное наказание в виде лишения свободы от пяти до пятнадцати лет.",
      ),
    );
  }
}
