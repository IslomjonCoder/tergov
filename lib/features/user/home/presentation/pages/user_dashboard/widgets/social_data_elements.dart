import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../utils/constants/colors.dart';

class SocialDataElements extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const SocialDataElements({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: TColors.text006, width: 1)),
              child: SvgPicture.asset(icon),
            ),
          ),
          const Gap(10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
          )
        ],
      ),
    );
  }
}
