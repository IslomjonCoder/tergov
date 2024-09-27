import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tergov/features/authentication/presentation/manager/password/password_visibility_cubit.dart';
import 'package:tergov/features/authentication/presentation/manager/remember_cubit/remember_cubit.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/constants/text_strings.dart';
import 'package:tergov/utils/routes/route_names.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email),
            ),
            const Gap(TSizes.spaceBtwInputFields),

            /// Password
            BlocProvider(
              create: (_) => PasswordVisibilityCubit(),
              child: Builder(builder: (context) {
                return TextFormField(
                  obscureText: context.watch<PasswordVisibilityCubit>().state,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: context.read<PasswordVisibilityCubit>().toggle,
                      icon: Icon(context.watch<PasswordVisibilityCubit>().state ? Iconsax.eye_slash : Iconsax.eye),
                    ),
                    labelText: TTexts.password,
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
                    BlocProvider(
                      create: (context) => RememberCubit(),
                      child: Builder(builder: (context) {
                        return Checkbox.adaptive(
                          value: context.watch<RememberCubit>().state,
                          onChanged: context.read<RememberCubit>().toggle,
                        );
                      }),
                    ),
                    const Text(TTexts.keepMe)
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.forgetPassword);
                    },
                    child: const Text(TTexts.forgetPassword))
              ],
            ),
            const Gap(TSizes.spaceBtwSections),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, RouteNames.navigation, (route) => false),
              child: const Text(TTexts.signIn),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(TTexts.notRegistered, style: Theme.of(context).textTheme.bodySmall),
                TextButton(onPressed: () {}, child: const Text(TTexts.createAccount))
              ],
            )
            // RichText(
            //   text: const TextSpan(
            //     text: TTexts.notRegistered,
            //     style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
            //     children: [
            //       TextSpan(
            //         text: TTexts.createAccount,
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Color(0xFF4318FF),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
