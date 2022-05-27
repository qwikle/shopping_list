import 'package:file_picker/file_picker.dart';
import 'package:formz/formz.dart';

enum AvatarValidationError { size, extname, empty }

class AvatarInput extends FormzInput<PlatformFile, AvatarValidationError> {
  AvatarInput.pure() : super.pure(PlatformFile(name: '', size: 0));
  AvatarInput.dirty({value}) : super.dirty(value);
  @override
  AvatarValidationError? validator(PlatformFile value) {
    if (!value.path!.endsWith('jpg') ||
        !value.path!.endsWith('png') ||
        !value.path!.endsWith('gif')) {
      return AvatarValidationError.extname;
    }
    if (value.size > 3145728) {
      return AvatarValidationError.size;
    }
    return null;
  }
}
