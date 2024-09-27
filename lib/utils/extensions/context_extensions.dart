import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}