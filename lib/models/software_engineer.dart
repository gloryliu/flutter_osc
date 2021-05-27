// 可能感兴趣的开源软件作者
import 'dart:core';

class SoftwareEngineer {
  // 关注状态
  int? followStatus;

  // 被关注数量
  int? followers;

  // 姓名
  String? name;

  // 项目名称
  String? project;

  // 项目数量
  int? projectCount;

  // 用户id
  int? userID;

  SoftwareEngineer(
      {this.followStatus,
      this.followers,
      this.name,
      this.project,
      this.projectCount,
      this.userID});

  SoftwareEngineer.fromJson(Map<String, dynamic> json) {
    followStatus = json['followStatus'];
    followers = json['followers'];
    name = json['name'];
    project = json['project'];
    projectCount = json['projectCount'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['followStatus'] = this.followStatus;
    data['followers'] = this.followers;
    data['name'] = this.name;
    data['project'] = this.project;
    data['projectCount'] = this.projectCount;
    data['userID'] = this.userID;
    return data;
  }

  static List<SoftwareEngineer> getListFromJson(Map<String, dynamic> json) {
    List<SoftwareEngineer> data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(SoftwareEngineer.fromJson(v));
      });
    }
    return data;
  }
}
