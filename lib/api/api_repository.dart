
import 'package:dio/dio.dart';
import 'package:flutter_osc/api/api_address.dart';
import 'package:flutter_osc/http/api_response.dart';
import 'package:flutter_osc/http/http_utils.dart';
import 'package:flutter_osc/models/software_engineer.dart';

class ApiRepository {
  static Future<ApiResponse<List<SoftwareEngineer>>> getSoftwareEngineerList() async {
    try {
      final response = await HttpUtils.get(ApiAddress.softwareEngineerList);
      var data = SoftwareEngineer.getListFromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}