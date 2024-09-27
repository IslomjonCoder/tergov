import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/headers/header.dart';
import 'package:tergov/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:tergov/utils/inherites/scaffold_key_inherited_widget.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: THeader(scaffoldKey: scaffoldKey),
      drawer: SidebarScaffoldKey(scaffoldKey: scaffoldKey, child: const TSidebar()),
      body: body,
    );
  }
}
