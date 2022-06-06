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
      if (Utils.youngerThan18(date)) {
        return DateValidationError.youngerThan18;
      }
      if (Utils.olderThan100(date)) {
        return DateValidationError.olderThan100;
      }
    } else if (type == DateType.pastDate) {
      if (date.isAfter(DateTime.now())) {
        return DateValidationError.past;
      }
    } else if (type == DateType.futureDate) {
      if (date.isBefore(DateTime.now())) {
        return DateValidationError.future;
      }
    }

    return null;
  }
}
