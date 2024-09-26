// import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tergov/common/widgets/layouts/sidebars/cubits/sidebar_active_cubit.dart';
import 'package:tergov/common/widgets/layouts/sidebars/cubits/sidebar_hover_cubit.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/sizes.dart';

class TMenuItem extends StatelessWidget {
  const TMenuItem({
    super.key,
    required this.itemName,
    required this.route,
    required this.icon,
  });

  final String itemName, route;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SidebarHoverCubit(),
      child: BlocBuilder<SideBarActiveCubit, String>(
        builder: (context, activeState) {
          return BlocBuilder<SidebarHoverCubit, bool>(
            builder: (context, hoverState) {
              return InkWell(
                onTap: () => context.read<SideBarActiveCubit>().changeActive(route),
                onHover: context.read<SidebarHoverCubit>().changeHover,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
                  child: Container(
                    decoration: BoxDecoration(
                      color: hoverState || activeState == route ? TColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(TSizes.md).copyWith(left: TSizes.lg),
                          child: activeState == route
                              ? Icon(icon, color: TColors.white, size: 22)
                              : Icon(icon, color: hoverState ? TColors.white : TColors.darkerGrey, size: 22),
                        ),
                        Flexible(
                          child: Text(
                            itemName,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.apply(color: hoverState || activeState == route ? TColors.white : TColors.darkerGrey),
                          ),
                        )
                      ],
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
