import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:tergov/utils/constants/colors.dart';

class WarningContainer extends StatelessWidget {
  final String title;
  final bool margin;

  const WarningContainer({
    super.key,
    required this.title, required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26.0),
      margin: EdgeInsets.symmetric(
        horizontal: margin? 100 : 0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: TColors.error, width: 2),
          color: TColors.white,),
      child: Column(
        children: [
          Text(
            "Предупреждение",
            style: TextStyle(
                fontSize:margin? 30 : 15,
                fontWeight: FontWeight.w700,
                color: TColors.black,
            ),
          ),
          Text(
            title,
            // style: margin? context.headlineMedium : context.titleSmall,
          ),
          const Gap(10),
          // const DottedUploadBox()
        ],
      ),
    );
  }
}
