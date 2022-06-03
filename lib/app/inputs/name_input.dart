import 'package:formz/formz.dart';
import 'package:get/utils.dart';

enum NameValidationError {
  empty,
  tooShort,
  invalid,
  tooLong,
}

class NameInput extends FormzInput<String, NameValidationError> {
  const NameInput.pure(String value) : super.pure('');
  const NameInput.dirty({String value = ""}) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    GetUtils.removeAllWhitespace(value);
    if (value.isEmpty) {
      return NameValidationError.empty;
    }
    if (!GetUtils.isAlphabetOnly(value)) {
      return NameValidationError.invalid;
    }
    if (GetUtils.isLengthLessThan(value, 3)) {
      return NameValidationError.tooShort;
    }
    if (GetUtils.isLengthGreaterThan(value, 50)) {
      return NameValidationError.tooLong;
    }
    return null;
  }
}
