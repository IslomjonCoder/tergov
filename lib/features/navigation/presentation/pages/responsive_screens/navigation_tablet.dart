import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/widgets/layouts/sidebars/cubits/sidebar_active_cubit.dart';

class NavigationTablet extends StatelessWidget {
  const NavigationTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: context.watch<SideBarActiveCubit>().index(),
      children: context.read<SideBarActiveCubit>().children(),
    );
  }
}
