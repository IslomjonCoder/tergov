import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/routes/route_names.dart';

Future<void> showAdaptiveLogoutDialog(BuildContext context) async {
  final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isMobile = constraints.maxWidth < 600;
          final bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
          final double dialogWidth = isMobile ? 300 : isTablet ? 500 : 600;

          if (isIOS) {
            return Center(
              child: SizedBox(
                width: dialogWidth,
                child: CupertinoAlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      child: const Text('Logout',style: TextStyle(color: TColors.error)),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, RouteNames.login, (Route<dynamic> route) => false);
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: SizedBox(
                width: dialogWidth,
                child: AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child:  const Text('Logout',style: TextStyle(color: TColors.error)),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, RouteNames.login, (Route<dynamic> route) => false);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
    },
  );
}
