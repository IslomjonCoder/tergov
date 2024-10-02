import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/features/dashboard/data/repositories/participant_repository.dart';
import 'package:tergov/features/user/home/cubit/info_form_first_cubit.dart';
import 'package:tergov/features/user/home/cubit/info_form_second_cubit.dart';
import 'package:tergov/features/user/home/presentation/manager/participant_upload_cubit.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/user_dashboard.dart';
import 'package:tergov/utils/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ParticipantUploadCubit(context.read<ParticipantRepository>())),
          BlocProvider(create: (context) => InfoFormSecondCubit()),
          BlocProvider(create: (context) => InfoFormFirstCubit()),
        ],
        child: BlocListener<ParticipantUploadCubit, ParticipantUploadState>(
          listener: (context, state) {
            if (state is ParticipantUploadLoading) {
              showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator()));
            }
            if (state is ParticipantUploadError) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message), backgroundColor: TColors.error, behavior: SnackBarBehavior.floating),
              );
            }
            if (state is ParticipantUploadSuccess) {
              Navigator.pop(context);
            }
          },
          child: const UserDashboardScreen(),
        ),
      ),
    );
  }
}
