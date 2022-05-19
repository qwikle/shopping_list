import 'package:formz/formz.dart';

enum PasswordValidationError { empty, regex, misMatch }

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value.isEmpty) return PasswordValidationError.empty;
    if (!regex.hasMatch(value)) return PasswordValidationError.regex;
    return null;
  }
}
