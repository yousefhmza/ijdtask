import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'interceptors.dart';

import '../../resources/resources.dart';
import '../../utils/constants.dart';
import '../local/cache_client.dart';
import '../local/storage_keys.dart';

const String _baseURL = Constants.appDomain;
const String _contentType = "Content-Type";
const String _accept = "accept";
const String _applicationJson = "application/json";
const String _acceptLanguage = "Accept-Language";
const String _authorization = "Authorization";

class ApiClient {
  final Dio _dio;
  final CacheClient _cacheClient;
  final Interceptor _prettyDioLogger;

  ApiClient(this._dio, this._cacheClient, this._prettyDioLogger) {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: _baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: Time.t30s,
      receiveTimeout: Time.t30s,
      sendTimeout: Time.t30s,
      headers: {
        _contentType: _applicationJson,
        _accept: _applicationJson,
        // _acceptLanguage: _cacheClient.get(StorageKeys.appLocale) ?? Platform.localeName.substring(0, 2),
      },
    );

    _dio.options = baseOptions;

    _dio.interceptors.add(AuthInterceptor());
    if (kDebugMode) _dio.interceptors.add(_prettyDioLogger);
  }

  void changeLocale(String languageCode) => _dio.options.headers[_acceptLanguage] = languageCode;

  Future<Response> get({
    required String url,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    final String? token = await _cacheClient.getSecuredData(StorageKeys.token);
    return await _dio.get(
      url,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          _authorization: token != null ? "Bearer $token" : Constants.empty,
        },
      ),
    );
  }

  Future<Response<T>> post<T>({
    required String url,
    required var requestBody,
    Map<String, dynamic>? queryParameters,
    String? customToken,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
  }) async {
    final String? token = await _cacheClient.getSecuredData(StorageKeys.token);
    return await _dio.post<T>(
      url,
      queryParameters: queryParameters,
      data: requestBody,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          _authorization: token != null ? "Bearer $token" : Constants.empty,
        },
      ),
    );
  }

  Future<Response> update({
    required String url,
    required var requestBody,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    final String? token = await _cacheClient.getSecuredData(StorageKeys.token);
    return await _dio.put(
      url,
      queryParameters: queryParameters,
      data: requestBody,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          _authorization: token != null ? "Bearer $token" : Constants.empty,
        },
      ),
    );
  }

  Future<Response> delete({
    required String url,
    var requestBody,
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    final String? token = await _cacheClient.getSecuredData(StorageKeys.token);
    return await _dio.delete(
      url,
      queryParameters: queryParameters,
      data: requestBody,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          _authorization: token != null ? "Bearer $token" : Constants.empty,
        },
      ),
    );
  }
}
