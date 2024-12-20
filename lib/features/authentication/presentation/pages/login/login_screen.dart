import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/widgets/dialogs/dialogs.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/authentication/data/repositories/auth_repository.dart';
import 'package:tergov/features/authentication/presentation/manager/login/login_cubit.dart';
import 'package:tergov/features/authentication/presentation/manager/remember_cubit/remember_cubit.dart';
import 'package:tergov/features/authentication/presentation/pages/login/responsive_screens/login_desktop_tablet.dart';
import 'package:tergov/features/authentication/presentation/pages/login/responsive_screens/login_mobile.dart';
import 'package:tergov/features/redirect/manager/user_status.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RememberCubit()),
        BlocProvider(
          create: (context) => LoginCubit(
            context.read<AuthRepository>(),
            rememberCubit: context.read<RememberCubit>(),
          ),
        ),
      ],
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            AppDialogs.showLoadingDialog(context);
          }

          if (state is LoginSuccess) {
            context.read<UserStatusCubit>().setAdminStatus();
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
