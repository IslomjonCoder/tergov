import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/info_form_2.dart';
import 'package:tergov/utils/constants/sizes.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../cubit/info_form_cubit.dart';
import '../widgets/background_image.dart';
import '../widgets/info_card.dart';
import '../widgets/info_form_1.dart';
import '../widgets/step_part.dart';
import '../widgets/warning_message.dart';

class UserDashboardDesktop extends StatelessWidget {
  const UserDashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        SingleChildScrollView(
          child: Center(
            child: BlocProvider(
              create: (context) => FormCubit(),
              child: BlocBuilder<FormCubit,bool>(
                builder: (context, state) {
                  return Column(
                    children: [
                      InfoCard(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: state ? const InfoFormFirst() : const InfoFormSecond()),
                                  const Gap(TSizes.lg),
                                  StepPart(step: "${S.of(context).step} ${state ? "1" : "2"}",),
                                ],
                              ),
                              const Gap(50),
                              const WarningMessage(
                                padding: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}







