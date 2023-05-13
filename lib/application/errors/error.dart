abstract class Error {
  final String? code;
  final String? message;

  Error(this.code, this.message);
}

class NetworkError extends Error {
  NetworkError({String? code = "400", String? message = "Network Error"})
      : super(code, message);
}

class GenericError extends Error {
  GenericError({String? code = "999", String? message = "Generic Error"})
      : super(code, message);
}
