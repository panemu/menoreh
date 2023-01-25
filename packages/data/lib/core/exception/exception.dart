import 'package:dio/dio.dart';
import 'package:data/core/_core.dart';

class ServerException implements Exception {
  final String? code;
  final String? message;

  ServerException({this.message, this.code});

  factory ServerException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        throw ServerException(message: EXCEPTION_CANCEL);
      case DioErrorType.connectTimeout:
        throw ServerException(message: EXCEPTION_CONNECTION_RTO);
      case DioErrorType.receiveTimeout:
        throw ServerException(message: EXCEPTION_RECEIVE_RTO);
      case DioErrorType.response:
        throw _handleError(dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.sendTimeout:
        throw ServerException(message: EXCEPTION_SEND_RTO);
      case DioErrorType.other:
        throw ServerException(message: EXCEPTION_OTHER);
      default:
        throw ServerException(message: EXCEPTION_UNKNOWN);
    }
  }

  static ServerException _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        throw ServerException(message: '$EXCEPTION_BAD_REQ ${error['msg']}');
      case 404:
        throw ServerException(message: EXCEPTION_NOT_FOUND);
      case 405:
        throw ServerException(message: EXCEPTION_METHOD);
      case 500:
        throw ServerException(message: EXCEPTION_ISE);
      default:
        throw ServerException(message: EXCEPTION_WRONG);
    }
  }
}

class AuthException implements Exception {
  final String? message;

  AuthException({this.message});

  factory AuthException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        throw AuthException(message: EXCEPTION_CANCEL);
      case DioErrorType.connectTimeout:
        throw AuthException(message: EXCEPTION_CONNECTION_RTO);
      case DioErrorType.receiveTimeout:
        throw AuthException(message: EXCEPTION_RECEIVE_RTO);
      case DioErrorType.response:
        throw _handleError(dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.sendTimeout:
        throw AuthException(message: EXCEPTION_SEND_RTO);
      case DioErrorType.other:
        throw AuthException(message: EXCEPTION_OTHER);
      default:
        throw AuthException(message: EXCEPTION_UNKNOWN);
    }
  }

  static AuthException _handleError(int statusCode, dynamic error) {
    if (statusCode == 401) {
      return AuthException(message: EXCEPTION_LOGIN_INVALID);
    } else if (statusCode < 200 || statusCode >= 300) {
      throw AuthException(message: '$EXCEPTION_LOGIN_ERROR $error');
    } else {
      throw AuthException(message: EXCEPTION_UNKNOWN);
    }
  }
}

class CacheException implements Exception {
  final String? message;

  CacheException({this.message});
}

class UnknownException implements Exception {
  final String? message;

  UnknownException({this.message});
}
