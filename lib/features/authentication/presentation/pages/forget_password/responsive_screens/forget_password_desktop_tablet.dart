import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/templates/login_template.dart';
import 'package:tergov/features/authentication/presentation/widgets/forgot_header_form.dart';

class ForgetPasswordDesktopTablet extends StatelessWidget {
  const ForgetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplate(child: ForgotHeaderAndForm());
  }
}
