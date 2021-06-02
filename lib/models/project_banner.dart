
// 软件头部banner

class SoftWareBanner {
  String? detail; // 描述
  String? href; // 链接
  int? id; // id
  String? img; // 图片
  String? name; // 项目名称
  int? obj_id; // id
  int? obj_type; // type
  String? pubDate; // 发布日期
  int? weight; //

  SoftWareBanner.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    href = json['href'];
    id = json['id'];
    img = json['img'];
    name = json['name'];
    obj_id = json['obj_id'];
    obj_type = json['obj_type'];
    pubDate = json['pubDate'];
    weight = json['weight'];
  }

  static List<SoftWareBanner> getListFromJson(Map<String, dynamic> json) {
    List<SoftWareBanner> data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(SoftWareBanner.fromJson(v));
      });
    }
    return data;
  }
}