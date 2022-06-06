import 'package:formz/formz.dart';
import 'package:shopping_list/app/config/types.dart';

enum DateValidationError {
  empty,
  invalid,
  outOfRange,
  youngerThan18,
  olderThan100,
  past,
  future,
}

class DateInput extends FormzInput<String, DateValidationError> {
  DateInput.pure() : super.pure('');
  DateInput.dirty({
    String value = '',
    DateType dateType = DateType.birthDay,
  }) : super.dirty(value);
  final DateType type = DateType.birthDay;
  @override
  DateValidationError? validator(String value) {
    if (value.isEmpty) {
      return DateValidationError.empty;
    }

    if (!Utils.isFrenchDate(value)) {
      return DateValidationError.invalid;
    }

    final formatedValue = value.split('/');
    final date = DateTime(
      int.parse(formatedValue[2]),
      int.parse(formatedValue[1]),
      int.parse(formatedValue[0]),
    );
    if (type == DateType.birthDay) {
      final younger = DateTime.now().subtract(const Duration(
        days: 6574,
      ));
      if (date.isAfter(younger)) return DateValidationError.youngerThan18;
    }

    return null;
  }
}
