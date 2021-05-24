import 'package:flutter_osc/db/database.dart';
import 'package:flutter_osc/entity/search_entity_db.dart';

// app 的配置信息 单例模式
class AppConfig {
  static final AppConfig _singleton = AppConfig._internal();
  AppConfig._internal();
  factory AppConfig() {
    return _singleton;
  }

  late  FlutterDatabase database;

  void init() async {
    database = await $FloorFlutterDatabase.databaseBuilder('flutter_database.db').build();
  }

  SearchKeywordDao getSearchKeywordDAO() {
    return database.searchKeywordDao;
  }
}
