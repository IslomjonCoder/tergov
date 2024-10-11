import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/cubit/info_form_cubit.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/background_image.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/info_card.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/info_form_1.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/info_form_2.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/step_part.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/warning_message.dart';
import 'package:tergov/utils/constants/sizes.dart';

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
                      TextButton(onPressed: (){
                      }, child: const Text("Помощь"),),
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
                                  StepPart(step: "Шаг ${state ? "1" : "2"}",),
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
