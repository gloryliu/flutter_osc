
// 全局配置
class Global {
  static String accessToken = '';
  static bool retryEnable = true;
  static bool get isRelease => bool.hasEnvironment('dart.vm.product');
}