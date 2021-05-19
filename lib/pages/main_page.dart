import 'package:flutter/material.dart';
import 'package:flutter_osc/pages/main/discover_page.dart';
import 'package:flutter_osc/pages/main/mine_page.dart';
import 'package:flutter_osc/pages/main/synthesize_page.dart';
import 'package:flutter_osc/pages/main/tweet_page.dart';
import 'package:flutter_osc/pages/utils/assets_color.dart';

import 'main/publish_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

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
    BottomNavigationBarItem(
        icon: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10),
          child: Center(
            child: Image.asset(
              'assets/ic_cross.png',
              width: 24,
              height: 24,
            ),
          ),
        ),
        label: '',
        tooltip: ''),
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
  Widget _currentPage;

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
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Color(color_ff24cf5f),
          items: _tabs,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _currentPage = _pages[_currentIndex];
            });
          },
        ),
        //floatingActionButton: _createPublishButton(),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _createPublishButton() {
    return Container(
      child: FloatingActionButton(
        child: Image.asset('assets/ic_cross.png'),
      ),
    );
  }
}