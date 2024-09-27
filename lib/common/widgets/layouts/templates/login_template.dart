import 'package:flutter/material.dart';
import 'package:tergov/common/styles/spacing_styles.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/sizes.dart';

class TLoginTemplate extends StatelessWidget {
  const TLoginTemplate({super.key, required this.child, this.padding = true});

  final Widget child;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550*2,
        child: SingleChildScrollView(
          child: Container(
            padding: padding ? TSpacingStyles.paddingWithAppBarHeight : EdgeInsets.zero,
            decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)),
            child: child,
          ),
        ),
      ),
    );
  }
}
