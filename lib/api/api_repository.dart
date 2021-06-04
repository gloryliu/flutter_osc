
import 'package:dio/dio.dart';
import 'package:flutter_osc/api/api_address.dart';
import 'package:flutter_osc/http/api_response.dart';
import 'package:flutter_osc/http/http_utils.dart';
import 'package:flutter_osc/models/last_info.dart';
import 'package:flutter_osc/models/project_banner.dart';
import 'package:flutter_osc/models/software_engineer.dart';
import 'package:flutter_osc/models/software_recommended.dart';

class ApiRepository {

  ///  关注推荐作者
  static Future<ApiResponse<List<SoftwareEngineer>>> getSoftwareEngineerList() async {
    try {
      final response = await HttpUtils.get(ApiAddress.softwareEngineerList);
      var data = SoftwareEngineer.getListFromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

  /// 软件列表
  static Future<ApiResponse<SoftwareList>> getSoftwareList(int pageSize,int page) async {
    try {
      Map<String,dynamic> params = Map();
      params['size'] = pageSize;
      params['page'] = page;
      print('getSoftwareList params= ${params.toString()}');
      final response = await HttpUtils.get(ApiAddress.softwareRecommendList,params: params);
      var data = SoftwareList.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

  ///  软件列表顶部banner
  static Future<ApiResponse<List<SoftWareBanner>>> getProjectBannerList() async {
    try {
      final response = await HttpUtils.get(ApiAddress.projectBanner);
      var data = SoftWareBanner.getListFromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

  ///  软件列表顶部banner
  static Future<ApiResponse<LastInfoBannerResult>> getLastInfoBanners() async {
    try {
      final response = await HttpUtils.get(ApiAddress.projectBanner);
      var data = LastInfoBannerResult.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}