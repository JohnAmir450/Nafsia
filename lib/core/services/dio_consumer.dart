import 'package:dio/dio.dart';
import 'package:nafsia/core/errors/custom_exceptions.dart';
import 'package:nafsia/core/services/api_consumer.dart';
import 'package:nafsia/core/services/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiEndpoints.baseUrl;
    dio.options.sendTimeout = const Duration(minutes: 1);
    dio.options.connectTimeout= const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(minutes: 1);
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFromData = false,
    String? customBaseUrl,
  }) async {
    try {
      final response = await dio.delete(
        customBaseUrl != null ? customBaseUrl + path : path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      String? customBaseUrl,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.get(
        customBaseUrl != null ? customBaseUrl + path : path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    Map<String, dynamic>? headers,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? customBaseUrl,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.patch(
        customBaseUrl != null ? customBaseUrl + path : path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? headers,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? customBaseUrl,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.post(
       customBaseUrl != null ? customBaseUrl + path : path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
Future put(String path,
    {dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? customBaseUrl,
    bool isFromData = false}) async {
  try {
    final response = await dio.put(
      customBaseUrl != null ? customBaseUrl + path : path,
      data: isFromData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  } on DioException catch (e) {
    handleDioExceptions(e);
  }
}

}
