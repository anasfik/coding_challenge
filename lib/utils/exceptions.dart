class NetworkRequestException implements Exception {
  final String message;
  final int statusCode;

  NetworkRequestException(this.message, this.statusCode);

  @override
  String toString() {
    return 'NetworkRequestException{message: $message, statusCode: $statusCode}';
  }
}
