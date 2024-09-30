import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../widgets/info_card.dart';
import '../widgets/info_form.dart';
import '../widgets/step_part.dart';
import '../widgets/warning_message.dart';

class UserDashboardMobile extends StatelessWidget {
  const UserDashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              InfoCard(
                padding: false,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoForm(),
                      Gap(TSizes.lg/2),
                      StepPart(),
                    ],
                  ),
                ),
              ),
              Gap(50),
              WarningMessage(padding: false,),
              Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
