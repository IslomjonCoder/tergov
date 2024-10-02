import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/user/home/cubit/info_form_first_cubit.dart';
import 'package:tergov/features/user/home/cubit/info_form_second_cubit.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/user_dashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => InfoFormSecondCubit(),
        child: BlocProvider(
          create: (context) => InfoFormFirstCubit(),
          child: const UserDashboardScreen(),
        ),
      ),
    );
  }
}
