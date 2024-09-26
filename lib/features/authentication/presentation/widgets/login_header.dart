import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:gap/gap.dart';
import 'package:tergov/utils/constants/image_strings.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Image(image: NetworkImage(TImages.logo), height: 100, width: 100),
          const Gap(TSizes.spaceBtwSections),
          Text(TTexts.loginTitle, style: context.headlineMedium),
          const Gap(TSizes.sm),
          Text(TTexts.loginSubTitle, style: context.bodyMedium)
        ],
      ),
    );
  }
}
