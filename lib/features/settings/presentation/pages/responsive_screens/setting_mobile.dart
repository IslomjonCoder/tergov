import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/settings/presentation/pages/responsive_screens/settings_desktop.dart';
import 'package:tergov/utils/constants/sizes.dart';

class SettingsMobile extends StatelessWidget {
  const SettingsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
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
                  child: const AddAdminFormMobile(),
                ),
                const SizedBox(height: 16),
                AddAdminButton(formKey: formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddAdminFormMobile extends StatelessWidget {
  const AddAdminFormMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdminEmailField(),
        Gap(TSizes.md),
        AdminPasswordField(),
        Gap(TSizes.md),
        AdminRoleDropdown(),
      ],
    );
  }
}
