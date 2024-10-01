import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/constants/text_strings.dart';
import 'package:tergov/utils/routes/route_names.dart';

import '../../../../generated/l10n.dart';

class ForgotHeaderAndForm extends StatelessWidget {
  const ForgotHeaderAndForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        IconButton(onPressed: () => context.canPop() ? context.pop() : context.pushNamed(RouteNames.login), icon: const Icon(Iconsax.arrow_left)),
        const Gap(TSizes.spaceBtwItems),
        Text(S.of(context).forgotPassword, style: context.headlineMedium),
        const Gap(TSizes.spaceBtwItems),
        Text(S.of(context).forgotPasswordSubTitle, style: context.labelMedium),
        const Gap(TSizes.spaceBtwSections * 2),

        /// Form
        Form(
          child: TextFormField(
            decoration:  InputDecoration(
              labelText: S.of(context).email,
              prefixIcon: const Icon(Iconsax.direct_right),
            ),
          ),
        ),
        const Gap(TSizes.spaceBtwSections),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.pushNamed(RouteNames.resetPassword);
            },
            child:  Text(S.of(context).submit),
          ),
        )
      ],
    );
  }
}
