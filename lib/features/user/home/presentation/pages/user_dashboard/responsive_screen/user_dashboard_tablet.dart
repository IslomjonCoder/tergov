import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/responsive_screen/user_dashboard_desktop.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/widgets/step_part.dart';
import 'package:tergov/utils/constants/sizes.dart';

class UserDashboardTablet extends StatelessWidget {
  const UserDashboardTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Gap(150), // Increase gap for desktop layout
              InfoCard(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Align widgets to top for desktop layout
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoForm(),
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
    );
  }
}
