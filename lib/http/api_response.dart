import 'package:flutter_osc/http/app_exceptions.dart';

class ApiResponse<T> implements Exception {
  Status status;
  T? data;
  AppException? exception;

  ApiResponse.completed(this.data) : status = Status.SUCCESS;

  ApiResponse.error(this.exception) : status = Status.SUCCESS;
}

enum Status { SUCCESS, FAIL }
