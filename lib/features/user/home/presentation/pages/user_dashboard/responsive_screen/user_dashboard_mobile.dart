import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/cubit/info_form_cubit.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../widgets/info_card.dart';
import '../widgets/info_form_1.dart';
import '../widgets/step_part.dart';
import '../widgets/warning_message.dart';

class UserDashboardMobile extends StatelessWidget {
  const UserDashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => FormCubit(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<FormCubit, bool>(
              builder: (context, state) {
                return Column(
                  children: [
                    InfoCard(
                      padding: false,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const InfoFormFirst(),
                            const Gap(TSizes.lg / 2),
                            StepPart(step: "${S.of(context).step} ${state ? "1" : "2"}",),
                          ],
                        ),
                      ),
                    ),
                    const Gap(50),
                    const WarningMessage(
                      padding: false,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
