import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tergov/generated/l10n.dart';
import 'package:tergov/main.dart';

import 'package:tergov/utils/constants/colors.dart';

Future<void> showAdaptiveLogoutDialog(BuildContext context) async {
  final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

  showAdaptiveDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        title: Text(S.of(context).logout),
        content: Text(S.of(context).areYouSureYouWantToLogOut),
        actions: [
          if (isIOS)
            TextButton(onPressed: Navigator.of(context).pop, child: Text(S.of(context).cancel))
          else
            CupertinoDialogAction(onPressed: Navigator.of(context).pop, child: Text(S.of(context).cancel)),
          if (isIOS)
            TextButton(
              child: Text(S.of(context).logout, style: const TextStyle(color: TColors.error)),
              onPressed: () {
                supabase.auth.signOut();
                context.pop();
              },
            )
          else
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text(S.of(context).logout),
              onPressed: () {
                supabase.auth.signOut();
                context.pop();
              },
            ),
        ],
      );
    },
  );
}
