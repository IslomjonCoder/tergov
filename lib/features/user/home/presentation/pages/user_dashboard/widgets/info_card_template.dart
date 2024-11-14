import 'package:flutter/cupertino.dart';
import 'package:tergov/utils/constants/colors.dart';

class InfoCardTemplate extends StatelessWidget {
  final bool padding;

  const InfoCardTemplate({
    super.key,
    required this.child,
    required this.padding,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      // Limit max width for large desktop screens
      margin: padding ? const EdgeInsets.symmetric(horizontal: 200, vertical: 100) : null,
      padding: padding? const EdgeInsets.all(32) : null,
      // Increased padding for desktop
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: TColors.white,
        boxShadow: [
          BoxShadow(
            color: TColors.primary.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(5, 10),
          ),
        ],
      ),
      child: child,
    );
  }

}