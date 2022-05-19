import 'package:formz/formz.dart';

enum CodeValidationError { empty }

class CodeInput extends FormzInput<String, CodeValidationError> {
  const CodeInput.pure() : super.pure('');
  const CodeInput.dirty({String value = ''}) : super.dirty(value);

  @override
  CodeValidationError? validator(String value) {
    if (value.isEmpty) return CodeValidationError.empty;
    return null;
  }
}
