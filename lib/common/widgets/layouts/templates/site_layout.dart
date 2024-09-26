import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/widgets/layouts/sidebars/cubits/sidebar_active_cubit.dart';
import 'package:tergov/common/widgets/responsive/responsive_design.dart';
import 'package:tergov/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:tergov/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:tergov/common/widgets/responsive/screens/tablet_layout.dart';

class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({super.key, this.desktop, this.tablet, this.mobile, this.useLayout = true});

  final Widget? desktop, tablet, mobile;

  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SideBarActiveCubit(),
        child: ResponsiveWidget(
          desktop: useLayout ? DesktopLayout(body: desktop) : desktop ?? Container(),
          tablet: useLayout ? TabletLayout(body: tablet ?? desktop) : tablet ?? desktop ?? Container(),
          mobile: useLayout ? MobileLayout(body: mobile ?? desktop) : mobile ?? desktop ?? Container(),
        ),
      ),
    );
  }
}
