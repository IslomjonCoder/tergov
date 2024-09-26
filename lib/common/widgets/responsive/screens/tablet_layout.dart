import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/headers/header.dart';
import 'package:tergov/common/widgets/layouts/sidebars/sidebar.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: THeader(scaffoldKey: scaffoldKey),
      drawer: const TSidebar(),
      body: body,
    );
  }
}
