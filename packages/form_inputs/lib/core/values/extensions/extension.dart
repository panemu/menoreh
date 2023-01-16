import 'package:form_inputs/core/_core.dart';

extension EmailExtension on EmailValidationError {
  String? get name {
    switch (this) {
      case EmailValidationError.empty:
        return 'Email tidak boleh kosong';
      case EmailValidationError.invalid:
        return 'Email salah';
      default:
        return '';
    }
  }
}

extension PasswordExtension on PasswordValidationError {
  String? get name {
    switch (this) {
      case PasswordValidationError.empty:
        return 'Password tidak boleh kosong';
      case PasswordValidationError.invalid:
        return 'Password salah';
      default:
        return '';
    }
  }
}
