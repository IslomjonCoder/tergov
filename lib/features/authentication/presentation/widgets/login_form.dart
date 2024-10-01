import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tergov/features/authentication/presentation/manager/login/login_cubit.dart';
import 'package:tergov/features/authentication/presentation/manager/password/password_visibility_cubit.dart';
import 'package:tergov/features/authentication/presentation/manager/remember_cubit/remember_cubit.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/constants/text_strings.dart';
import 'package:tergov/utils/routes/route_names.dart';
import 'package:tergov/utils/validators/validators.dart';

import '../../../../generated/l10n.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Email
            TextFormField(
              decoration:  InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: S.of(context).email),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: context.read<LoginCubit>().emailController,
              validator: AppValidators.validateEmail,
            ),
            const Gap(TSizes.spaceBtwInputFields),

            /// Password
            BlocProvider(
              create: (_) => PasswordVisibilityCubit(),
              child: Builder(builder: (context) {
                return TextFormField(
                  textInputAction: TextInputAction.done,
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
              }),
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
                     Text(S.of(context).keepMeLoggedIn)
                  ],
                ),

                /// Forget Password
                TextButton(
                    child: Text(S.of(context).forgotPassword))
                  onPressed: () => Navigator.pushNamed(context, RouteNames.forgetPassword),
                )
              ],
            ),
            const Gap(TSizes.spaceBtwSections),
            ElevatedButton(
              child:  Text(S.of(context).signIn),
              onPressed: context.read<LoginCubit>().login,
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).notRegistered, style: Theme.of(context).textTheme.bodySmall),
                TextButton(onPressed: () {}, child:  Text(S.of(context).createAccount))
              ],
            )
          ],
        ),
      ),
    );
  }
}
