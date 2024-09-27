import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../utils/constants/colors.dart';

class WarningContainer extends StatelessWidget {
  final String title;

  const WarningContainer({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 100,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: TColors.error, width: 2),
          color: TColors.white),
      child: Column(
        children: [
          const Text(
            "Предупреждение",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: TColors.black),
          ),
          Text(
            title,
            style: context.headlineMedium,
          ),
          const Gap(10),
          // const DottedUploadBox()
        ],
      ),
    );
  }
}
