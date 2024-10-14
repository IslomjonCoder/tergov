import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tergov/common/widgets/dialogs/dialogs.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/authentication/data/repositories/auth_repository.dart';
import 'package:tergov/features/settings/presentation/manager/add_admin/add_admin_cubit.dart';
import 'package:tergov/features/settings/presentation/pages/responsive_screens/setting_mobile.dart';
import 'package:tergov/features/settings/presentation/pages/responsive_screens/settings_desktop.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddAdminCubit(context.read<AuthRepository>()),
      child: BlocListener<AddAdminCubit, AddAdminState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            Navigator.pop(context);
            context.read<AddAdminCubit>().clearForm();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Admin added successfully!')),
            );
          }
          if (state.status.isFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error adding admin: ${state.failure?.message}')),
            );
          }
          if (state.status.isInProgress) {
            AppDialogs.showLoadingDialog(context);
          }
        },
        child: const TSiteTemplate(
          useLayout: false,
          desktop: SettingsDesktop(),
          mobile: SettingsMobile(),
        ),
      ),
    );
  }
}
