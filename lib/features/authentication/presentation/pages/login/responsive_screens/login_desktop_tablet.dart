import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/common/widgets/layouts/templates/login_template.dart';
import 'package:tergov/features/authentication/presentation/widgets/login_form.dart';
import 'package:tergov/features/authentication/presentation/widgets/login_header.dart';

import '../../../../../../common/styles/spacing_styles.dart';
import '../../../../../../utils/constants/sizes.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(
      padding: false,
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Header
                  TLoginHeader(),

                  /// Form
                  TLoginForm(),
                ],
              ),
            ),
          ),
          const Gap(50),
          Expanded(
              child: Image.asset(
            "assets/images/login.png",
            fit: BoxFit.fill,
          )),
        ],
      ),
    );
  }
}
