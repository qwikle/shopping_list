class CodeTokenFailureException implements Exception {
  const CodeTokenFailureException(
      [this.message = 'An unknown error occurred.']);
  final String message;
  factory CodeTokenFailureException.fromCode(int code) {
    switch (code) {
      case 400:
        return const CodeTokenFailureException('invalid code or expired.');
      case 422:
        return const CodeTokenFailureException('invalid code or email.');
      default:
        return const CodeTokenFailureException();
    }
  }
}
