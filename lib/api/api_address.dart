
class ApiAddress {
  static final String baseUrl = 'https://h5.oschina.net';
  // 感兴趣的开源软件作者
  static final String softwareEngineerList = '/apiv3/projectAuthors?size=10';

  // 获取推荐的软件列表
  static final String softwareRecommendList = '/apiv3/projectRecommend';

  // 软件顶部banner
  static final String projectBanner = '/apiv3/projectBanner';

  // 最新页面的banner内容
  static final String lastInfoBanner = '/action/apiv2/banner?catalog=1';
}