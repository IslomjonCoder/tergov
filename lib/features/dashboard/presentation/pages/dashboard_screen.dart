import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/responsive_screens/dashboard_desktop.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/responsive_screens/dashboard_mobile.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/responsive_screens/dashboard_tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false,
      desktop: DashboardDesktop(),
      tablet: DashboardTablet(),
      mobile: DashboardMobile(),
    );
  }
}
