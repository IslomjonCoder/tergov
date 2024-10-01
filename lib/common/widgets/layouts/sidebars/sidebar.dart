import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tergov/common/widgets/app_ui/app_constrained_scroll_view.dart';
import 'package:tergov/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:tergov/features/home/presentation/pages/dashboard/responsive_screens/dashboard_desktop.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/constants/text_strings.dart';
import 'package:tergov/utils/routes/route_names.dart';

import '../../../../generated/l10n.dart';
import '../log_out_dialog/log_out_dialog.dart';

class TSidebar extends StatelessWidget {
  const TSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: TColors.white,
          border: Border(right: BorderSide(color: TColors.grey)),
        ),
        child: AppConstrainedScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: Text(
                  TTexts.appName,
                  style: context.headlineMedium,
                ),
              ),
              const Divider(),
              Padding(
                padding:  const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).menu, style: Theme.of(context).textTheme.bodySmall?.apply(letterSpacingDelta: 1.2)),
                    const Gap(TSizes.sm),
                    TMenuItem(itemName: S.of(context).dashboard, route: RouteNames.dashboard, icon: Iconsax.home),
                    TMenuItem(itemName: S.of(context).profile, route: RouteNames.profile, icon: Iconsax.profile_2user),
                    TMenuItem(itemName: S.of(context).user, route: RouteNames.user, icon: Iconsax.user),
                  ],
                ),
              ),
              const Spacer(),

              Padding(
                padding:  EdgeInsets.all(TSizes.md),
                child: TMenuItem(
                  itemName: S.of(context).logout,
                  route: RouteNames.login,
                  icon: Iconsax.logout,
                  onTap: () => showAdaptiveLogoutDialog(context)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
