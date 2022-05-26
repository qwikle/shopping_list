class SignInFailureException implements Exception {
  const SignInFailureException([this.message = 'An unknown error occurred.']);
  final String message;
  factory SignInFailureException.fromCode(int code) {
    switch (code) {
      case 400:
        return const SignInFailureException('Invalid email or password.');
      default:
        return const SignInFailureException();
    }
  }
}
