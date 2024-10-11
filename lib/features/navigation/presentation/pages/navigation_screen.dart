import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/widgets/layouts/sidebars/cubits/sidebar_active_cubit.dart';
import 'package:tergov/common/widgets/layouts/templates/site_layout.dart';
import 'package:tergov/features/navigation/presentation/pages/responsive_screens/navigation_desktop.dart';
import 'package:tergov/features/navigation/presentation/pages/responsive_screens/navigation_mobile.dart';
import 'package:tergov/features/navigation/presentation/pages/responsive_screens/navigation_tablet.dart';

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
