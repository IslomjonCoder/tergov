// import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tergov/common/widgets/images/t_rounded_image.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/enums.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/device/device_utility.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: TColors.grey)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        /// Mobile Menu
        leading: !TDeviceUtils.isDesktopScreen(context)
            ? IconButton(onPressed: () => scaffoldKey?.currentState?.openDrawer(), icon: const Icon(Iconsax.menu))
            : null,

        /// Search Field
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (TDeviceUtils.isDesktopScreen(context)) Text('Pages/Dashboard', style: context.bodySmall),
            Text('Main Dashboard', style: TDeviceUtils.isDesktopScreen(context) ? context.headlineMedium : context.headlineSmall),
          ],
        ),

        /// Actions
        actions: <Widget>[
          if (!TDeviceUtils.isMobileScreen(context)) IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          if (!TDeviceUtils.isMobileScreen(context)) IconButton(onPressed: () {}, icon: const Icon(Iconsax.moon)),
          if (!TDeviceUtils.isMobileScreen(context)) IconButton(onPressed: () {}, icon: const Icon(Iconsax.info_circle)),
          const Gap(TSizes.spaceBtwItems / 2),
          Row(
            children: [
              const TRoundedImage(
                imageType: ImageType.network,
                image:
                    'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fHww',
                width: 40,
                height: 40,
                padding: 2,
                fit: BoxFit.cover,
              ),
              const Gap(TSizes.sm),
              if (!TDeviceUtils.isMobileScreen(context))
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Coding with T', style: Theme.of(context).textTheme.titleLarge),
                    Text('support@CodingWithT.com', style: Theme.of(context).textTheme.labelMedium),
                  ],
                )
            ],
          ),
          if (TDeviceUtils.isMobileScreen(context))
            PopupMenuButton(
              color: TColors.white,
              offset: const Offset(0, TSizes.appBarHeight),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: MoreItem(
                      itemName: 'Notifications',
                      icon: Iconsax.notification,
                    ),
                  ),
                  const PopupMenuItem(
                    child: MoreItem(
                      itemName: 'Change theme',
                      icon: Iconsax.moon,
                    ),
                  ),
                  const PopupMenuItem(
                    child: MoreItem(
                      itemName: 'Information',
                      icon: Iconsax.info_circle,
                    ),
                  ),
                ];
              },
              icon: Icon(Icons.adaptive.more),
            )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}

class MoreItem extends StatelessWidget {
  const MoreItem({
    super.key,
    required this.itemName,
    required this.icon,
  });

  final String itemName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 22),
        const Gap(TSizes.sm),
        Expanded(child: Text(itemName, style: context.bodyMedium)),
      ],
    );
  }
}
