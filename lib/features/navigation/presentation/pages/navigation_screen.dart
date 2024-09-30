import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:tergov/features/navigation/presentation/pages/responsive_screens/navigation_desktop.dart';
import 'package:tergov/features/navigation/presentation/pages/responsive_screens/navigation_mobile.dart';
import 'package:tergov/features/navigation/presentation/pages/responsive_screens/navigation_tablet.dart';
import 'package:tergov/features/profile/presentation/pages/profile_screen.dart';
import 'package:tergov/utils/routes/route_names.dart';

import '../../../../common/widgets/layouts/sidebars/cubits/sidebar_active_cubit.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SideBarActiveCubit(),
        child: const TSiteTemplate(

          desktop: NavigationDesktop(),
          mobile: NavigationMobile(),
          tablet: NavigationTablet(),
        ),
      ),
    );
  }
}
