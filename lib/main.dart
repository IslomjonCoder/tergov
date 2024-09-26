import 'package:flutter/material.dart';
import 'package:tergov/app.dart';

void main() {
  runApp(const App());
}

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.child,
  });

  final double? height, width;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
