import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/responsive_screen/user_dashboard_desktop.dart';
import 'package:tergov/features/user/home/presentation/pages/user_dashboard/responsive_screen/user_dashboard_tablet.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: UserDashboardDesktop(),
      tablet: UserDashboardTablet(),
      // mobile: DashboardMobile(),
    );
  }
}
