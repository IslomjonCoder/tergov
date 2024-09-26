import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/authentication/presentation/pages/forget_password/responsive_screens/forget_password_desktop_tablet.dart';
import 'package:tergov/features/authentication/presentation/pages/forget_password/responsive_screens/forget_password_mobile.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: ForgetPasswordDesktopTablet(),
      mobile: ForgetPasswordMobile(),
    );
  }
}
