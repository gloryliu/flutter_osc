import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_osc/pages/main_page.dart';
import 'package:flutter_osc/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());

  // 状态栏透明
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

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
