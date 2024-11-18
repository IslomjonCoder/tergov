import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/social_data_elements.dart';
import 'package:tergov/utils/constants/colors.dart';

class StepPart extends StatelessWidget {
  final String step;

  const StepPart({
    super.key, required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          step,
          style: const TextStyle(
              fontSize: 30,
              color: TColors.text006,
              fontWeight: FontWeight.w600,),
        ),
        const Gap(5.0),
        Image.asset("assets/images/step_icon.png", width: 400),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SocialDataElements(
              title: 'O`zbekiston RespublikasiToshkent shahri, Y.Rajabiy ko`chasi',
              icon: "assets/icons/location.svg",
              onTap: () {},
            ),
            SocialDataElements(
              title: '(71) 233-65-34',
              icon: "assets/icons/phone.svg",
              onTap: () {},
            ),
            SocialDataElements(
              title: 'tergov.uz@gmail.com',
              icon: "assets/icons/email.svg",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
