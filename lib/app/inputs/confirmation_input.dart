import 'package:formz/formz.dart';

enum ConfirmationValidator { empty, misMatch }

class ConfirmationInput extends FormzInput<String, ConfirmationValidator> {
  const ConfirmationInput.pure(this.field) : super.pure('');
  const ConfirmationInput.dirty(this.field, {String value = ''})
      : super.dirty(value);

  final String field;

  @override
  ConfirmationValidator? validator(String value) {
    if (value.isEmpty) return ConfirmationValidator.empty;
    if (field != value) return ConfirmationValidator.misMatch;
    return null;
  }
}
