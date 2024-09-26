import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/templates/login_template.dart';
import 'package:tergov/features/authentication/presentation/widgets/login_form.dart';
import 'package:tergov/features/authentication/presentation/widgets/login_header.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplate(
      child: Column(
        children: [
          /// Header
          TLoginHeader(),

          /// Form
          TLoginForm(),
        ],
      ),
    );
  }
}
