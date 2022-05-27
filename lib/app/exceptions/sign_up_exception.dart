import '../data/models/unprocessable.model.dart';

class SignUpFailureException implements Exception {
  const SignUpFailureException([this.message = 'An unknown error occurred.']);
  final String message;

  factory SignUpFailureException.fromCode(List<Unprocessable> error) {
    final result = error.indexWhere((element) => element.field == 'email');
    if (result != -1) {
      return const SignUpFailureException('This email is already used.');
    }
    return const SignUpFailureException("One or more fields failed on check.");
  }
}
