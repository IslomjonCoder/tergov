import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/generated/l10n.dart';
import 'package:tergov/utils/constants/sizes.dart';
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
            icon: const Icon(Icons.close),),
        const Gap(TSizes.spaceBtwItems),
        Text(S.of(context).changeYourPasswordTitle, style: context.headlineMedium, textAlign: TextAlign.center),
        const Gap(TSizes.spaceBtwItems),
        Text('example@gmail.com', style: context.labelLarge, textAlign: TextAlign.center),
        const Gap(TSizes.spaceBtwItems),
        Text(S.of(context).changeYourPasswordSubTitle, style: context.labelMedium, textAlign: TextAlign.center),
        const Gap(TSizes.spaceBtwSections),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text(S.of(context).done))),
        const Gap(TSizes.spaceBtwItems),
        TextButton(onPressed: () {}, child: Text(S.of(context).resendEmail)),
      ],
    );
  }
}
