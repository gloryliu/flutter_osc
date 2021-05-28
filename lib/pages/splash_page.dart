import 'dart:async';

import 'package:flutter/material.dart';

import 'main_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _currentTime = 6;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if (_currentTime <= 0) {
        return _jumpMainPage();
      }
      setState(() {
        _currentTime--;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/welcome.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              right: 10,
              top: MediaQuery.of(context).padding.top + 10,
              child: _createCountDown(),
            )
          ],
        ),
      ),
    );
  }

  void _jumpMainPage() {
    _timer.cancel();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return MainPage();
    }), (route) => false);
  }

  Widget _createCountDown() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 40,
        height: 40,
        color: Colors.black.withOpacity(0.5),
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '跳过',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                '${_currentTime}s',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
          onTap: _jumpMainPage,
        ),
      ),
    );
  }
}
