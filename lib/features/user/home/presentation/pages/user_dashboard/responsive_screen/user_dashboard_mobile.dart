import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/cubit/info_form_cubit.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/info_card.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/info_form_1.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/info_form_2.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/step_part.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/warning_message.dart';
import 'package:tergov/utils/constants/sizes.dart';

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
                            if (state) const InfoFormFirst() else const InfoFormSecond(),
                            const Gap(TSizes.lg / 2),
                            StepPart(step: "Шаг ${state ? "1" : "2"}",),
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
