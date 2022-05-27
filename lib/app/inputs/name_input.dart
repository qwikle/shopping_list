import 'package:formz/formz.dart';
import 'package:get/utils.dart';

enum NameValidationError {
  empty,
  minLength,
  maxLength,
}

class NameInput extends FormzInput<String, NameValidationError> {
  const NameInput.pure(String value) : super.pure('');
  const NameInput.dirty({String value = ""}) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) {
      return NameValidationError.empty;
    }
    if (GetUtils.isLengthLessThan(value, 3)) {
      return NameValidationError.minLength;
    }
    if (GetUtils.isLengthGreaterThan(value, 50)) {
      return NameValidationError.maxLength;
    }
    return null;
  }
}
