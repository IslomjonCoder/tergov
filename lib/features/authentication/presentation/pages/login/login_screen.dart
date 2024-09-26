import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/authentication/presentation/pages/login/responsive_screens/login_desktop_tablet.dart';
import 'package:tergov/features/authentication/presentation/pages/login/responsive_screens/login_mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false,
      desktop: LoginDesktopTablet(),
      mobile: LoginMobile(),
    );
  }
}
