import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tergov/common/cubits/locale_cubit/locale_cubit.dart';
import 'package:tergov/features/authentication/data/models/language_model.dart';
import 'package:tergov/features/authentication/presentation/manager/login/login_cubit.dart';
import 'package:tergov/features/authentication/presentation/manager/password/password_visibility_cubit.dart';
import 'package:tergov/features/authentication/presentation/manager/remember_cubit/remember_cubit.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/responsive_screens/dashboard_desktop.dart';
import 'package:tergov/features/redirect/manager/user_status.dart';
import 'package:tergov/generated/l10n.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/routes/route_names.dart';
import 'package:tergov/utils/validators/validators.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Email
            TextFormField(
              decoration: InputDecoration(prefixIcon: const Icon(Iconsax.direct_right), labelText: S.of(context).email),
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUnfocus,

              textInputAction: TextInputAction.next,
              controller: context.read<LoginCubit>().emailController,
              validator: AppValidators.validateEmail,
              autofillHints: const [AutofillHints.email],
            ),
            const Gap(TSizes.spaceBtwInputFields),

            /// Password
            BlocProvider(
              create: (_) => PasswordVisibilityCubit(),
              child: Builder(
                builder: (context) {
                  return TextFormField(
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.password],
                    autovalidateMode: AutovalidateMode.onUnfocus,

                    keyboardType: TextInputType.visiblePassword,
                    controller: context.read<LoginCubit>().passwordController,
                    obscureText: context.watch<PasswordVisibilityCubit>().state,
                    validator: AppValidators.validatePassword,
                    onFieldSubmitted: (value) => context.read<LoginCubit>().login(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: context.read<PasswordVisibilityCubit>().toggle,
                        icon: Icon(context.watch<PasswordVisibilityCubit>().state ? Iconsax.eye_slash : Iconsax.eye),
                      ),
                      labelText: S.of(context).password,
                    ),
                  );
                },
              ),
            ),
            const Gap(TSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox.adaptive(
                      value: context.watch<RememberCubit>().state,
                      onChanged: context.read<RememberCubit>().toggle,
                    ),
                    Text(S.of(context).keepMeLoggedIn),
                  ],
                ),

                /// Forget Password
                TextButton(
                  child: Text(S.of(context).forgotPassword),
                  onPressed: () => Navigator.pushNamed(context, RouteNames.forgetPassword),
                ),
              ],
            ),
            const Gap(TSizes.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: context.read<LoginCubit>().login, child: Text(S.of(context).signIn))),
            const Gap(TSizes.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: context.read<UserStatusCubit>().setUser, child: Text(S.of(context).continueAsUser))),
            const Gap(TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).notRegistered, style: Theme.of(context).textTheme.bodySmall),
                TextButton(onPressed: () {}, child: Text(S.of(context).createAccount)),
              ],
            ),
            const Gap(TSizes.spaceBtwSections),
            Center(
              child: Container(
                decoration:  BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LanguageModel(code:FlagsCode.UZ,locale: Locale('uz')),
                      const LanguageModel(code:FlagsCode.RU,locale: Locale('ru')),
                      const LanguageModel(code:FlagsCode.GB,locale: Locale('en')),
                    ].map((flag) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems),
                        child: IconButton(
                          icon: Flag.fromCode(flag.code, height: 30, width: 30),
                          onPressed: () => context.read<LocaleCubit>().changeLocale(flag.locale),
                        ),
                      );
                    }).toList().separatedBy(VerticalDivider(color: Theme.of(context).colorScheme.primary)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
