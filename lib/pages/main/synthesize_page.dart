import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../search_page.dart';

// 综合页面

class SynthesizePage extends StatefulWidget {
  @override
  _SynthesizePageState createState() => _SynthesizePageState();
}

class _SynthesizePageState extends State<SynthesizePage>
    with SingleTickerProviderStateMixin {
  final List<Widget> _tabName = [
    Text('关注'),
    Text('软件'),
    Text('最新'),
    Text('推荐'),
    Text('问答'),
    Text('博客'),
    Text('英文'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        initialIndex: 2,
        length: _tabName.length,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: TabBar(
              isScrollable: true,
              indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
              tabs: _tabName,
              labelStyle: TextStyle(color: Colors.red, fontSize: 24),
              unselectedLabelStyle:
                  TextStyle(color: Colors.black, fontSize: 14),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                },
              )
            ],
          ),
          body: TabBarView(
            children: _tabName,
          ),
        ),
      ),
    );
  }
}
