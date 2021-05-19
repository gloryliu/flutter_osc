import 'package:flutter/material.dart';

// 我的页面

class MinePage extends StatefulWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('MinePage'),
      ),
    );
  }
}
