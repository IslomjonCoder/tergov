import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:tergov/utils/constants/sizes.dart';

/// Widget for displaying different layouts based on screen size
class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key, required this.desktop, required this.tablet, required this.mobile, this.useLayout = true});

  /// Widget for desktop layout
  final Widget desktop;

  /// Widget for tablet layout
  final Widget tablet;

  /// Widget for mobile layout
  final Widget mobile;

  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final bodyWidth = constraints.maxWidth + (!useLayout ? context.width - constraints.maxWidth : 0);
        if (bodyWidth >= TSizes.desktopScreenSize) {
          return desktop;
        } else if (constraints.maxWidth <= TSizes.desktopScreenSize && constraints.maxWidth >= TSizes.tabletScreenSize) {
          return tablet;
        }
        return mobile;
      },
    );
  }
}
