import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/authentication/presentation/pages/reset_password/responsive_screens/reset_password_desktop_tablet.dart';
import 'package:tergov/features/authentication/presentation/pages/reset_password/responsive_screens/reset_password_mobile.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false,
      desktop: ResetPasswordDesktopTablet(),
      mobile: ResetPasswordMobile(),
    );

  }
}
