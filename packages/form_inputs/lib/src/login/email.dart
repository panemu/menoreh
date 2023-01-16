import 'package:form_inputs/core/_core.dart';
import 'package:formz/formz.dart';

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    if (value!.isEmpty) return EmailValidationError.empty;
    if(!_emailRegExp.hasMatch(value)) return EmailValidationError.invalid;
    return null;
  }
}
