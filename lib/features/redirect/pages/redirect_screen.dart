import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:tergov/features/navigation/presentation/pages/navigation_screen.dart';
import 'package:tergov/features/redirect/manager/user_status.dart';
import 'package:tergov/features/user/home/presentation/pages/home_page.dart';
import 'package:tergov/main.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatusCubit, bool?>(
      builder: (context, state) {
        if (state == null) {
          return const LoginScreen();
        }
        if (state) {
          return const HomePage();
        }
        return StreamBuilder(
          stream: supabase.auth.onAuthStateChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.session != null) {
                return const NavigationScreen();
              }
              return const LoginScreen();
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
