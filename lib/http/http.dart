import 'package:dio/dio.dart';
import 'package:flutter_osc/http/error_interceptor.dart';
import 'package:flutter_osc/http/global.dart';

class Http {
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;

  static Http _instance = Http._internal();

  factory Http() => _instance;

  Dio dio = Dio();

  Http._internal() {
    BaseOptions options = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
    );

    dio.options = options;

    dio.interceptors.add(ErrorInterceptor());
    dio.interceptors.add(LogInterceptor());
  }

  void init(
    String baseUrl,
    int connectTimeout,
    int receiveTimeout,
    List<Interceptor>? interceptors,
  ) {
    dio.options = dio.options.copyWith(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        contentType: 'application/json; charset=utf-8',
        headers: {});
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  void setHeaders(Map<String, dynamic> headers) {
    dio.options.headers.addAll(headers);
  }

  Map<String, dynamic> getAuthorizationHeader() {
    var headers;
    String accessToken = Global.accessToken;
    if (accessToken != null) {
      headers = {'token': accessToken};
    }
    return headers;
  }

  Future get(
    String path, {
    Map<String, dynamic?>? params,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(extra: {});
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.copyWith(headers: _authorization);
    }
    Response response;
    response =
        await dio.get(path, queryParameters: params, options: requestOptions);
        print('dio params = ${params.toString()}');
        print('dio url = ${response.realUri}');
    return response.data;
  }

  Future post(
    String path, {
    Map<String, dynamic?>? params,
    data,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.copyWith(headers: _authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: params,
    );
    return response.data;
  }

  Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.copyWith(headers: _authorization);
    }
    var response = await dio.post(path,
        data: FormData.fromMap(params ?? Map()), options: requestOptions);
    return response.data;
  }
}
