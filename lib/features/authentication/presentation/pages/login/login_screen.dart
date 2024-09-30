import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/authentication/presentation/manager/login/login_cubit.dart';
import 'package:tergov/features/authentication/presentation/manager/remember_cubit/remember_cubit.dart';
import 'package:tergov/features/authentication/presentation/pages/login/responsive_screens/login_desktop_tablet.dart';
import 'package:tergov/features/authentication/presentation/pages/login/responsive_screens/login_mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RememberCubit()),
        BlocProvider(create: (context) => LoginCubit(rememberCubit: context.read<RememberCubit>())),
      ],
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              builder: (_) => const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          }

          if (state is LoginSuccess) {
            Navigator.pop(context);
          }

          if (state is LoginError) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: const TSiteTemplate(
          useLayout: false,
          desktop: LoginDesktopTablet(),
          mobile: LoginMobile(),
        ),
      ),
    );
  }
}
