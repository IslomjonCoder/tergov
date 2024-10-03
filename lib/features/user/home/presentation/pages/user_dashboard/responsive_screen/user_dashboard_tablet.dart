import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/step_part.dart';
import 'package:tergov/utils/constants/sizes.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../cubit/info_form_cubit.dart';
import '../widgets/info_card.dart';
import '../widgets/info_form_1.dart';
import '../widgets/warning_message.dart';

class UserDashboardTablet extends StatelessWidget {
  const UserDashboardTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                              const Gap(TSizes.lg),
                              StepPart(step: "${S.of(context).step} ${state ? "1" : "2"}",),

                            ],
                          ),
                        ),
                      ),
                      const WarningMessage(padding: false,),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
