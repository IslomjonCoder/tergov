import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tergov/common/widgets/images/t_rounded_image.dart';
import 'package:tergov/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/enums.dart';
import 'package:tergov/utils/constants/sizes.dart';

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
            const TRoundedImage(
              imageType: ImageType.network,
              image: 'https://cdn.logojoy.com/wp-content/uploads/20220329171712/dating-app-logo-tinder.png',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            const Gap(TSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("MENU", style: Theme.of(context).textTheme.bodySmall?.apply(letterSpacingDelta: 1.2)),
                  const Gap(TSizes.sm),
                  const TMenuItem(itemName: "Dashboard", route: "/dashboard", icon: Iconsax.status),
                  const TMenuItem(itemName: "Media", route: "/users", icon: Iconsax.image),
                  const TMenuItem(itemName: "Banners", route: "/profile", icon: Iconsax.picture_frame),
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
