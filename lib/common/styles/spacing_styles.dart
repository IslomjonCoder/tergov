import 'package:flutter/material.dart';
import 'package:tergov/utils/constants/sizes.dart';

class TSpacingStyles {
  TSpacingStyles._();

  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
  );
}
