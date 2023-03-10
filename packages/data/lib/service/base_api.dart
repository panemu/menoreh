import 'dart:developer';

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseApi {
  final FlavorConfig env;

  BaseApi(this.env) {
    FlavorConfig? env = FlavorConfig.instance;
    log("FlavorConfig info => ${env.env},[${env.values!.baseApi}] ");
  }

  static String AUTHTOKEN = '';

  static PrettyDioLogger _logger = PrettyDioLogger(
    responseBody: false,
    request: false,
    requestBody: false,
    responseHeader: false,
    compact: false,
  );

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final BaseOptions _options = BaseOptions(
        baseUrl: FlavorConfig.instance.values!.baseApi!,
        receiveTimeout: FlavorConfig.instance.values!.delay,
        connectTimeout: FlavorConfig.instance.values!.delay,
        sendTimeout: FlavorConfig.instance.values!.delay,
        headers: {
          'Content-Type': 'application/json',
          'authorization': AUTHTOKEN,
        },
      );

      final Dio _dio = Dio(_options)..interceptors.add(_logger);

      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is DioError) {
        throw ServerException.fromDioError(e);
      } else {
        rethrow;
      }
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final BaseOptions _options = BaseOptions(
        baseUrl: FlavorConfig.instance.values!.baseApi!,
        receiveTimeout: FlavorConfig.instance.values!.delay,
        connectTimeout: FlavorConfig.instance.values!.delay,
        sendTimeout: FlavorConfig.instance.values!.delay,
        headers: {
          'Content-Type': 'application/json',
          'authorization': AUTHTOKEN,
        },
      );

      final Dio _dio = Dio(_options)..interceptors.add(_logger);

      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is DioError) {
        throw ServerException.fromDioError(e);
      } else {
        rethrow;
      }
    }
  }

  Future<dynamic> delete(String uri,
      {data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      final BaseOptions _options = BaseOptions(
        baseUrl: FlavorConfig.instance.values!.baseApi!,
        receiveTimeout: FlavorConfig.instance.values!.delay,
        connectTimeout: FlavorConfig.instance.values!.delay,
        sendTimeout: FlavorConfig.instance.values!.delay,
        headers: {
          'Content-Type': 'application/json',
          'authorization': AUTHTOKEN,
        },
      );

      final Dio _dio = Dio(_options)..interceptors.add(_logger);

      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is DioError) {
        throw ServerException.fromDioError(e);
      } else {
        rethrow;
      }
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final BaseOptions _options = BaseOptions(
        baseUrl: FlavorConfig.instance.values!.baseApi!,
        receiveTimeout: FlavorConfig.instance.values!.delay,
        connectTimeout: FlavorConfig.instance.values!.delay,
        sendTimeout: FlavorConfig.instance.values!.delay,
        headers: {
          'Content-Type': 'application/json',
          'authorization': AUTHTOKEN,
        },
      );

      final Dio _dio = Dio(_options)..interceptors.add(_logger);

      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is DioError) {
        throw ServerException.fromDioError(e);
      } else {
        rethrow;
      }
    }
  }

  Future<dynamic> postLogin(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      BaseOptions _options = BaseOptions(
        baseUrl: FlavorConfig.instance.values!.baseApi!,
        receiveTimeout: FlavorConfig.instance.values!.delay,
        connectTimeout: FlavorConfig.instance.values!.delay,
        sendTimeout: FlavorConfig.instance.values!.delay,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      final _dio = Dio(_options)..interceptors.add(_logger);

      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is DioError) {
        throw AuthException.fromDioError(e);
      } else {
        rethrow;
      }
    }
  }
}
