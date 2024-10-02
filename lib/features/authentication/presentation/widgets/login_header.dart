import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:gap/gap.dart';
import 'package:tergov/generated/l10n.dart';
import 'package:tergov/utils/constants/sizes.dart';
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
          Text(S.of(context).signIn, style: context.headlineMedium),
          const Gap(TSizes.sm),
          Text(S.of(context).enterYourEmail, style: context.bodyMedium)
        ],
      ),
    );
  }
}
