import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/dashboard/presentation/manager/users_table/users_list_cubit.dart';
import 'package:tergov/features/profile/presentation/pages/responsive_screens/profile_desktop.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersListCubit(),
      child: const TSiteTemplate(
        useLayout: false,
        desktop: ProfileDesktop(),
      ),
    );
  }
}
