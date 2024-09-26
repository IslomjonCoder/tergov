import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/templates/login_template.dart';
import 'package:tergov/features/authentication/presentation/widgets/reset_password_widget.dart';

class ResetPasswordDesktopTablet extends StatelessWidget {
  const ResetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplate(child: TResetPasswordWidget());
  }
}
