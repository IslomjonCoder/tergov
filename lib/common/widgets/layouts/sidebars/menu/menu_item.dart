// import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/widgets/layouts/sidebars/cubits/sidebar_active_cubit.dart';
import 'package:tergov/common/widgets/layouts/sidebars/cubits/sidebar_hover_cubit.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/sizes.dart';
import 'package:tergov/utils/device/device_utility.dart';
import 'package:tergov/utils/inherites/scaffold_key_inherited_widget.dart';

class TMenuItem extends StatelessWidget {
  const TMenuItem({
    super.key,
    required this.itemName,
    required this.route,
    required this.icon,
    this.onTap,
  });


  final String itemName, route;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SidebarHoverCubit(),
      child: BlocBuilder<SideBarActiveCubit, String>(
        builder: (context, activeState) {
          return BlocBuilder<SidebarHoverCubit, bool>(
            builder: (context, hoverState) {
              return InkWell(
                onTap: onTap ?? () {
                  if (!(activeState == route)) {
                    context.read<SideBarActiveCubit>().changeActive(route);
                    final scaffoldKey = SidebarScaffoldKey.of(context)?.scaffoldKey;
                    if (scaffoldKey != null && !TDeviceUtils.isDesktopScreen(context)) scaffoldKey.currentState?.closeDrawer();
                  }
                },
                onHover: context.read<SidebarHoverCubit>().changeHover,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: hoverState || activeState == route ? TColors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(TSizes.md).copyWith(left: TSizes.lg),
                            child: activeState == route
                                ? Icon(
                                    icon,
                                    color: TColors.primary,
                                    size: 22,
                                  )
                                : Icon(icon, color: hoverState ? TColors.primary : TColors.darkGrey, size: 22),
                          ),
                          Expanded(
                            child: Text(
                              itemName,
                              style: Theme.of(context).textTheme.bodyMedium?.apply(
                                    color: hoverState || activeState == route ? TColors.primary : TColors.darkGrey,
                                  ),
                            ),
                          ),
                          Visibility(
                            visible: activeState == route || hoverState,
                            child: Container(
                              width: 4,
                              height: 36,
                              decoration: BoxDecoration(
                                color: hoverState || activeState == route ? TColors.primary : TColors.darkGrey,
                                borderRadius: BorderRadius.circular(TSizes.borderRadiusFull),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
