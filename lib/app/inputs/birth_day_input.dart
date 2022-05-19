import 'package:formz/formz.dart';

enum DateOfBirthValidationError { invalid, young }

class DateOfBirthInput
    extends FormzInput<DateTime, DateOfBirthValidationError> {
  DateOfBirthInput.pure() : super.pure(DateTime.now());
  DateOfBirthInput.dirty(DateTime value) : super.dirty(value);

  @override
  DateOfBirthValidationError? validator(DateTime value) {
    final limitAge = DateTime.now().subtract(const Duration(days: 5844));
    if (value.isAfter(limitAge)) return DateOfBirthValidationError.young;
    return null;
  }
}
