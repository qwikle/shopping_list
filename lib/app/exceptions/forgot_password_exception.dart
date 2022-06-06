class ForgotPasswordFailureException implements Exception {
  const ForgotPasswordFailureException(
      [this.message = 'An unknown error occurred.']);
  final String message;
  factory ForgotPasswordFailureException.fromCode(int code) {
    switch (code) {
      case 400:
        return const ForgotPasswordFailureException('User not found');
      default:
        return const ForgotPasswordFailureException();
    }
  }
}
