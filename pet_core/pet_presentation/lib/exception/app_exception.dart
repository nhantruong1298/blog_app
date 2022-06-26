class AppException {
  String? displayMessage;
  dynamic exceptionCode;
  dynamic originalException;

  AppException(this.displayMessage,
      {this.exceptionCode, this.originalException});
}
