import 'package:dio/dio.dart';
import 'package:flutter_osc/http/http.dart';

class HttpUtils {
  static void init(
      {required String baseUrl,
      int connectTimeout = 3000,
      int receiveTimeout = 3000,
      List<Interceptor>? interceptors}) {
    Http().init(baseUrl, connectTimeout, receiveTimeout, interceptors);
  }

  static void setHeaders(Map<String, dynamic> map) {
    Http().setHeaders(map);
  }

  static Future get(
    String path, {
    Map<String, dynamic?>? params,
    Options? options,
  }) async {
    return await Http().get(path, params: params, options: options);
  }

  static Future post(
    String path, {
    Map<String, dynamic?>? params,
    data,
    Options? options,
  }) async {
    return await Http()
        .post(path, params: params, data: data, options: options);
  }

  static Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    return await Http().postForm(path, params: params, options: options);
  }
}
