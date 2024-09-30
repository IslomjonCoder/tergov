import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/app_ui/app_constrained_scroll_view.dart';
import 'package:tergov/features/authentication/presentation/widgets/login_form.dart';
import 'package:tergov/features/authentication/presentation/widgets/login_header.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/device/device_utility.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppConstrainedScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace).copyWith(top: TSizes.defaultSpace + TDeviceUtils.getAppBarHeight()),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
            TLoginHeader(),

            /// Form
            TLoginForm(),
          ],
        ),
      ),
    );
  }
}
