import 'package:formz/formz.dart';

enum ConfirmationValidationError { empty, misMatch }

class ConfirmationInput
    extends FormzInput<String, ConfirmationValidationError> {
  const ConfirmationInput.pure(this.field) : super.pure('');
  const ConfirmationInput.dirty(this.field, {String value = ''})
      : super.dirty(value);

  final String field;

  @override
  ConfirmationValidationError? validator(String value) {
    if (value.isEmpty) return ConfirmationValidationError.empty;
    if (field != value) return ConfirmationValidationError.misMatch;
    return null;
  }
}
