import 'package:form_inputs/core/_core.dart';
import 'package:formz/formz.dart';

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    if (value!.isEmpty) return PasswordValidationError.empty;
    // if (!_passwordRegExp.hasMatch(value)) return PasswordValidationError.invalid;
    return null;
  }
}
