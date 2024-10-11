import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/authentication/presentation/manager/password/password_visibility_cubit.dart';
import 'package:tergov/features/settings/presentation/manager/add_admin/add_admin_cubit.dart';
import 'package:tergov/utils/constants/enums.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/validators/validators.dart';

class SettingsDesktop extends StatelessWidget {
  const SettingsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Add Admin', style: Theme.of(context).textTheme.headlineMedium),
              const Gap(TSizes.spaceBtwItems),
              Form(
                key: formKey,
                child: const AddAdminForm(),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: AddAdminButton(formKey: formKey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddAdminForm extends StatelessWidget {
  const AddAdminForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: AdminEmailField()),
          Gap(TSizes.md),
          Expanded(child: AdminPasswordField()),
          Gap(TSizes.md),
          Expanded(child: AdminRoleDropdown()),
        ],
      ),
    );
  }
}

class AdminEmailField extends StatelessWidget {
  const AdminEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: context.read<AddAdminCubit>().emailController,
      decoration: const InputDecoration(labelText: 'Admin Email'),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: AppValidators.validateEmail,
    );
  }
}

class AdminPasswordField extends StatelessWidget {
  const AdminPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordVisibilityCubit(),
      child: BlocBuilder<PasswordVisibilityCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: context.read<AddAdminCubit>().passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: context.read<PasswordVisibilityCubit>().toggle,
                icon: Icon(state ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            obscureText: state,
            validator: AppValidators.validatePassword,
          );
        },
      ),
    );
  }
}

class AdminRoleDropdown extends StatelessWidget {
  const AdminRoleDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<AdminType>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      value: context.watch<AddAdminCubit>().state.role,
      decoration: const InputDecoration(labelText: 'Select Role'),
      isExpanded: true,
      validator: (value) => AppValidators.validateEmpty(value?.name, fieldName: 'Admin role'),
      onChanged: context.read<AddAdminCubit>().changeRole,
      items: AdminType.values
          .map((role) => DropdownMenuItem<AdminType>(value: role, child: Text(role.name)))
          .toList(),
    );
  }
}

class AddAdminButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AddAdminButton({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context.read<AddAdminCubit>().addAdmin();
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text('Add Admin'),
      ),
    );
  }
}
