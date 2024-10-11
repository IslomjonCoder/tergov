import 'package:flutter/material.dart';

class SidebarScaffoldKey extends InheritedWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SidebarScaffoldKey({super.key, required this.scaffoldKey, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return scaffoldKey != (oldWidget as SidebarScaffoldKey).scaffoldKey;
  }

  static SidebarScaffoldKey? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<SidebarScaffoldKey>();
}
