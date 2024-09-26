import 'package:flutter/material.dart';
import 'package:tergov/common/widgets/layouts/headers/header.dart';
import 'package:tergov/common/widgets/layouts/sidebars/sidebar.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key, this.body});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: [
          const Expanded(child: TSidebar()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // HEADER
                const THeader(),
                // BODY
                if (body != null) body!,
              ],
            ),
          )
        ],
      ),
    );
  }
}
