import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tergov/common/widgets/images/t_rounded_image.dart';
import 'package:tergov/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/enums.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/constants/text_strings.dart';

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
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Text(TTexts.appName,style: context.headlineMedium,),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("MENU", style: Theme.of(context).textTheme.bodySmall?.apply(letterSpacingDelta: 1.2)),
                  const Gap(TSizes.sm),
                  const TMenuItem(itemName: "Dashboard", route: "/dashboard", icon: Iconsax.home),
                  const TMenuItem(itemName: "Profile", route: "/users", icon: Iconsax.profile_2user),
                  const TMenuItem(itemName: "Settings", route: "/settings", icon: Iconsax.setting),
                  const TMenuItem(itemName: "Logout", route: "/login", icon: Iconsax.logout),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
