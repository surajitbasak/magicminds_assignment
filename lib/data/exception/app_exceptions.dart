import '../../configs/localization/localization_config.dart';

/// Base class for custom application exceptions.
class AppException implements Exception {
  final String? _message; // Message associated with the exception
  final String? _prefix; // Prefix for the exception

  /// Constructor for creating an [AppException] instance.
  ///
  /// The [message] parameter represents the message associated with the exception,
  /// and the [prefix] parameter represents the prefix for the exception.
  AppException([this._message = '', this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message'; // Returns the formatted error message
  }
}

/// Exception class representing a fetch data error during communication.
class FetchDataException extends AppException {
  /// Constructor for creating a [FetchDataException] instance.
  ///
  /// The [message] parameter represents the error message.
  FetchDataException([String? message]) : super(message, localization.errorDuringCommunication);
}

/// Exception class representing a bad request error.
class BadRequestException extends AppException {
  /// Constructor for creating a [BadRequestException] instance.
  ///
  /// The [message] parameter represents the error message.
  BadRequestException([String? message]) : super(message, localization.invalidRequest);
}

/// Exception class representing an unauthorized request error.
class UnauthorisedException extends AppException {
  /// Constructor for creating an [UnauthorisedException] instance.
  ///
  /// The [message] parameter represents the error message.
  UnauthorisedException([String? message]) : super(message, localization.unauthorisedRequest);
}

/// Exception class representing an internal server error.
class ServerException extends AppException {
  /// Constructor for creating an [ServerException] instance.
  ///
  /// The [message] parameter represents the error message.
  ServerException([String? message]) : super(message, localization.internalServerError);
}

/// Exception class representing an not found error.
class NotFoundException extends AppException {
  /// Constructor for creating an [NotFoundException] instance.
  ///
  /// The [message] parameter represents the error message.
  NotFoundException([String? message]) : super(message, localization.notFound);
}

/// Exception class representing an invalid input error.
class InvalidInputException extends AppException {
  /// Constructor for creating an [InvalidInputException] instance.
  ///
  /// The [message] parameter represents the error message.
  InvalidInputException([String? message]) : super(message, localization.invalidInput);
}

/// Exception class representing a no internet connection error.
class NoInternetException extends AppException {
  /// Constructor for creating a [NoInternetException] instance.
  ///
  /// The [message] parameter represents the error message.
  NoInternetException([String? message]) : super(message, localization.noInternetConnection);
}
