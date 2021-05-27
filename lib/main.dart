import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_osc/config/app_config.dart';
import 'package:flutter_osc/http/http_utils.dart';
import 'package:flutter_osc/pages/splash_page.dart';

import 'api/api_address.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HttpUtils.init(baseUrl: ApiAddress.baseUrl);

  AppConfig().init();

  runApp(MyApp());

  // 状态栏透明
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: SplashPage(),
    );
  }
}
