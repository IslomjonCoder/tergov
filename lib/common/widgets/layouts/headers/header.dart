// import 'package:awesome_extensions/awesome_extensions.dart';
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
      decoration: const BoxDecoration(
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
        title: TDeviceUtils.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.search_normal),
                    hintText: "Search anything...",
                  ),
                ),
              )
            : null,

        /// Actions
        actions: <Widget>[
          if (!TDeviceUtils.isDesktopScreen(context)) IconButton(onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
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
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}
