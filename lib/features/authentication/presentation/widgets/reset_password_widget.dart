import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/constants/text_strings.dart';
import 'package:tergov/utils/routes/route_names.dart';

class TResetPasswordWidget extends StatelessWidget {
  const TResetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, RouteNames.login, (route) => false);
            },
            icon: const Icon(Icons.close)),
        const Gap(TSizes.spaceBtwItems),
        Text(TTexts.changeYourPasswordTitle, style: context.headlineMedium, textAlign: TextAlign.center),
        const Gap(TSizes.spaceBtwItems),
        Text('example@123', style: context.labelLarge, textAlign: TextAlign.center),
        const Gap(TSizes.spaceBtwItems),
        Text(TTexts.changeYourPasswordSubTitle, style: context.labelMedium, textAlign: TextAlign.center),
        const Gap(TSizes.spaceBtwSections),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text(TTexts.done))),
        const Gap(TSizes.spaceBtwItems),
        TextButton(onPressed: () {}, child: const Text(TTexts.resendEmail))
      ],
    );
  }
}
