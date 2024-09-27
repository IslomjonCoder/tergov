import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/text_field.dart';
import 'package:tergov/utils/constants/sizes.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../widgets/background_image.dart';
import '../widgets/info_card.dart';
import '../widgets/info_form.dart';
import '../widgets/step_part.dart';
import '../widgets/warning_message.dart';

class UserDashboardDesktop extends StatelessWidget {
  const UserDashboardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage(),
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InfoCard(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: InfoForm()),
                        Gap(TSizes.lg),
                        StepPart(),
                      ],
                    ),
                  ),
                ),
                Gap(50),
                WarningMessage(),
                Gap(50),
              ],
            ),
          ),
        ),
      ],
    );
  }
}







