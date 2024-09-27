import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:tergov/features/profile/presentation/pages/profile_screen.dart';
import 'package:tergov/utils/routes/route_names.dart';

class SideBarActiveCubit extends Cubit<String> {
  final Map<String, Widget> routes = {
    RouteNames.dashboard: const DashboardScreen(),
    RouteNames.profile: const ProfileScreen(),
  };


  SideBarActiveCubit() : super(RouteNames.dashboard) ;

  void changeActive(String active) => emit(active);

  List<Widget> children() => routes.values.toList();

  int index() => routes.keys.toList().indexOf(state);
}
