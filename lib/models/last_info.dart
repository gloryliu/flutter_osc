
/// 最新页面相关实体

class LastInfoBannerResult {
  String? nextPageToken;
  String? prevPageToken;
  int? requestCount;
  int? responseCount;
  int? totalResults;
  List<LastInfoBannerItem>? items;

  LastInfoBannerResult.fromJson(Map<String, dynamic> json) {
    var result = json['result'];
    if (result != null) {
      nextPageToken = result['nextPageToken'];
      prevPageToken = result['prevPageToken'];
      requestCount = result['requestCount'];
      responseCount = result['responseCount'];
      totalResults = result['totalResults'];
      var itemsJson = result['items'];
      if (itemsJson != null) {
        List<LastInfoBannerItem> banners = [];
        itemsJson.forEach((v) {
          banners.add(LastInfoBannerItem.fromJson(v));
        });
        items = banners;
      }
    }
  }
}

class LastInfoBannerItem {
  String? detail;
  String? href;
  int? id;
  String? img;
  String? name;
  String? pubDate;
  int? type;
  int? weight;

  LastInfoBannerItem.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    href = json['href'];
    id = json['id'];
    img = json['img'];
    name = json['name'];
    pubDate = json['pubDate'];
    type = json['type'];
    weight = json['weight'];
  }
}
