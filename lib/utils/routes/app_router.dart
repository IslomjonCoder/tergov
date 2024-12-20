import 'package:flutter/material.dart';
import 'package:tergov/features/authentication/presentation/pages/forget_password/forget_password_screen.dart';
import 'package:tergov/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:tergov/features/authentication/presentation/pages/reset_password/reset_password_screen.dart';
import 'package:tergov/features/navigation/presentation/pages/navigation_screen.dart';
import 'package:tergov/features/redirect/pages/redirect_screen.dart';
import 'package:tergov/features/user/home/presentation/pages/home_page.dart';
import 'package:tergov/utils/routes/route_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.root:
        return MaterialPageRoute(builder: (context) =>  const RedirectScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteNames.forgetPassword:
        return MaterialPageRoute(builder: (context) => const ForgetPasswordScreen());
      case RouteNames.resetPassword:
        return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());
        case RouteNames.navigation:
        return MaterialPageRoute(builder: (context) => const NavigationScreen());
        case RouteNames.user:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text("Page not found"))));
    }
  }
}
