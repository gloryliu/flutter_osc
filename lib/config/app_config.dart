
// app 的配置信息

import 'package:flutter_osc/db/database.dart';

class AppConfig {
  static init() async{
    final database = await $FlutterDatabase()
        .databaseBuilder('flutter_database.db')
        .build();
    final dao = database.taskDao;
  }
}