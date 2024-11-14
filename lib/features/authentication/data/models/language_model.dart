import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class LanguageModel {
  final FlagsCode code;
  final Locale locale;

  const LanguageModel({required this.code, required this.locale});
}
