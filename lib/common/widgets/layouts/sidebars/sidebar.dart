import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tergov/common/widgets/app_ui/app_constrained_scroll_view.dart';
import 'package:tergov/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/constants/text_strings.dart';
import 'package:tergov/utils/routes/route_names.dart';

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
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("MENU", style: Theme.of(context).textTheme.bodySmall?.apply(letterSpacingDelta: 1.2)),
                    const Gap(TSizes.sm),
                    const TMenuItem(itemName: "Dashboard", route: RouteNames.dashboard, icon: Iconsax.home),
                    const TMenuItem(itemName: "Profile", route: RouteNames.profile, icon: Iconsax.profile_2user),
                  ],
                ),
              ),
              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: TMenuItem(
                  itemName: "Logout",
                  route: RouteNames.login,
                  icon: Iconsax.logout,
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, RouteNames.login, (Route<dynamic> route) => false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
