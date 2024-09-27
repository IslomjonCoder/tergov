import 'package:flutter/material.dart';
import 'info_card_template.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.child, this.padding = true});

  final bool padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InfoCardTemplate(
      padding: padding,
      child: child,
    );
  }
}
