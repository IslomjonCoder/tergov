import 'package:flutter/material.dart';
import 'package:tergov/common/styles/spacing_styles.dart';
import 'package:tergov/utils/constants/colors.dart';
import 'package:tergov/utils/constants/sizes.dart';

class TLoginTemplate extends StatelessWidget {
  const TLoginTemplate({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: TSpacingStyles.paddingWithAppBarHeight,
            decoration: BoxDecoration(color: TColors.white, borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)),
            child: child,
          ),
        ),
      ),
    );
  }
}
