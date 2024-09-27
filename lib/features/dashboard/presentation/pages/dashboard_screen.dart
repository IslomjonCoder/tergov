import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/dashboard/presentation/pages/responsive_screens/dashboard_desktop.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false,
      desktop: DashboardDesktop(),
    );
  }
}
