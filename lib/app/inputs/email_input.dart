import 'package:formz/formz.dart';
import 'package:get/get.dart';

enum EmailValidationError {
  empty,
  notEmail,
  used,
  misMatch,
}

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure({this.used = false}) : super.pure('');
  const EmailInput.dirty({String value = '', this.used = false})
      : super.dirty(value);
  final bool used;
  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    if (!GetUtils.isEmail(value)) return EmailValidationError.notEmail;
    if (used) return EmailValidationError.used;
    return null;
  }
}
