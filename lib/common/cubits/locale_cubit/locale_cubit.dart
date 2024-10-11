import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LocaleCubit extends HydratedCubit<Locale> {
  LocaleCubit() : super(const Locale('uz'));

  Future<void> changeLocale(Locale locale) async => emit(locale);

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    final selectedLocale = json['selected_locale'] ?? 'uz';
    return Locale(selectedLocale);
  }

  @override
  Map<String, dynamic>? toJson(Locale state) => {'selected_locale': state.languageCode};
}
