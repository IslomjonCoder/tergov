
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tergov/main.dart';

import 'package:tergov/utils/constants/colors.dart';

Future<void> showAdaptiveLogoutDialog(BuildContext context) async {
  final isIOS = Theme.of(context).platform == TargetPlatform.iOS;


  showAdaptiveDialog(
    context: context,
    builder: (BuildContext context) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isMobile = constraints.maxWidth < 600;
          final bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
          final double dialogWidth = isMobile
              ? 300
              : isTablet
                  ? 500
                  : 600;

          // if (isIOS) {
          //   return Center(
          //     child: SizedBox(
          //       width: dialogWidth,
          //       child: CupertinoAlertDialog(
          //         title: Text(S.of(context).logout),
          //         content: const Text('Are you sure you want to log out?'),
          //         actions: [
          //           CupertinoDialogAction(
          //             child: const Text('Cancel'),
          //             onPressed: () {
          //               Navigator.of(context).pop();
          //             },
          //           ),
          //           CupertinoDialogAction(
          //             isDestructiveAction: true,
          //             child: const Text('Logout',style: TextStyle(color: TColors.error)),
          //             onPressed: () {
          //               Navigator.pushNamedAndRemoveUntil(context, RouteNames.login, (Route<dynamic> route) => false);
          //             },
          //           ),
          //         ],
          //       ),
          //     ),
          //   );
          // } else {
          return Center(
            child: SizedBox(
              width: dialogWidth,
              child: AlertDialog.adaptive(
                title: const Text('Logout'),
                content: const Text('Are you sure you want to log out?'),
                actions: [
                  if (isIOS) TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel')) else CupertinoDialogAction(onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
                  if (isIOS) TextButton(
                          child: const Text('Logout', style: TextStyle(color: TColors.error)),
                          onPressed: () {
                            supabase.auth.signOut();
                            context.pop();
                          },
                        ) else CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: const Text('Logout', style: TextStyle(color: TColors.error)),
                          onPressed: () {
                            supabase.auth.signOut();
                            context.pop();

                          },
                        ),
                ],
              ),
            ),
          );

          // }
        },
      );
    },
  );
}
