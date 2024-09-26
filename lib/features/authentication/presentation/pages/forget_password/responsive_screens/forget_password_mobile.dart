import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/app_ui/app_constrained_scroll_view.dart';
import 'package:tergov/features/authentication/presentation/widgets/forgot_header_form.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/device/device_utility.dart';

class ForgetPasswordMobile extends StatelessWidget {
  const ForgetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppConstrainedScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace).copyWith(top: TSizes.defaultSpace + TDeviceUtils.getAppBarHeight()),
        child: const ForgotHeaderAndForm(),
      ),
    );
  }
}
