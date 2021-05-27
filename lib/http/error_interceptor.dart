
import 'package:dio/dio.dart';
import 'package:flutter_osc/http/app_exceptions.dart';

// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    AppException appException = AppException.create(err);
    err.error = appException;
    super.onError(err, handler);
  }
}