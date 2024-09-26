import 'package:flutter/material.dart';
import 'package:tergov/common/styles/spacing_styles.dart';
import 'package:tergov/common/widgets/app_ui/app_constrained_scroll_view.dart';
import 'package:tergov/features/authentication/presentation/widgets/reset_password_widget.dart';

class ResetPasswordMobile extends StatelessWidget {
  const ResetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppConstrainedScrollView(
        padding: TSpacingStyles.paddingWithAppBarHeight,
        child: Center(child: TResetPasswordWidget()),
      ),
    );
  }
}
