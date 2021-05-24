import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_osc/config/app_config.dart';
import 'package:flutter_osc/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
