import 'package:tergov/generated/l10n.dart';

abstract class AppValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.email_empty;
    }
    final RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return S.current.invalid_email;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.password_empty;
    }
    if (value.length < 6) {
      return S.current.password_min_length;
    }
    return null;
  }

  static String? validateEmpty(String? value, {required String fieldName}) {
    if (value == null || value.isEmpty) {
      return S.current.field_empty(fieldName);
    }
    return null;
  }

  static String? validateType<T>(T? value, {required String fieldName}) {
    if (value == null) {
      return S.current.field_empty(fieldName);
    }
    return null;
  }
}
