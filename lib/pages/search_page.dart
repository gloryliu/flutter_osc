import 'package:flutter/material.dart';
import 'package:flutter_osc/widgets/appbar_search_widget.dart';

// 搜索页面

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: SAppBarSearch(),
        body: Center(
          child: Text('搜索'),
        ),
      ),
    );
  }
}
