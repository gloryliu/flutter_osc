import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_osc/pages/main/discover_page.dart';
import 'package:flutter_osc/pages/main/mine_page.dart';
import 'package:flutter_osc/pages/main/synthesize_page.dart';
import 'package:flutter_osc/pages/main/tweet_page.dart';
import 'package:flutter_osc/pages/utils/assets_color.dart';

import 'main/publish_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<BottomNavigationBarItem> _tabs = [
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/ic_home_synthesize_normal.png',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'assets/ic_home_synthesize_select.png',
          width: 24,
          height: 24,
        ),
        label: '综合',
        tooltip: ''),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/ic_home_tweet_normal.png',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'assets/ic_home_tweet_select.png',
          width: 24,
          height: 24,
        ),
        label: '动弹',
        tooltip: ''),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: '', tooltip: ''),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/ic_home_discover_normal.png',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'assets/ic_home_discover_select.png',
          width: 24,
          height: 24,
        ),
        label: '发现',
        tooltip: ''),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/ic_home_user_normal.png',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'assets/ic_home_user_select.png',
          width: 24,
          height: 24,
        ),
        label: '我的',
        tooltip: ''),
  ];

  final List<Widget> _pages = [
    SynthesizePage(),
    TweetPage(),
    PublishPage(),
    DiscoverPage(),
    MinePage()
  ];

  int _currentIndex = 0;
  late Widget _currentPage;

  @override
  void initState() {
    _currentPage = _pages[_currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _currentPage,
        bottomNavigationBar: Theme(
          data: ThemeData(
            highlightColor: Color.fromRGBO(0, 0, 0, 0),
            splashColor: Color.fromRGBO(0, 0, 0, 0),
          ),
          child: BottomNavigationBar(
            fixedColor: Color(color_ff24cf5f),
            items: _tabs,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              if(index == 2) {
                return _gotoPublic();
              }
              setState(() {
                _currentIndex = index;
                _currentPage = _pages[_currentIndex];
              });
            },
          ),
        ),
        floatingActionButton: _createPublishButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void _gotoPublic() {
    print('打开发布页面');
  }

  Widget _createPublishButton() {
    return Container(
      width: 36,
      height: 36,
      margin: EdgeInsets.only(top: 56),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Color(0xFFF0F0F0),
        borderRadius:BorderRadius.circular(18)
      ),
      child: FloatingActionButton(
        child: Center(
          child: Text('+',style: TextStyle(color: Color(color_ff24cf5f),fontSize: 25),),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        onPressed: _gotoPublic,
      ),
    );
  }
}
