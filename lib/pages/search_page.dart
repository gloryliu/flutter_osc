import 'package:flutter/material.dart';
import 'package:flutter_osc/config/app_config.dart';
import 'package:flutter_osc/entity/search_entity_db.dart';
import 'package:flutter_osc/widgets/appbar_search_widget.dart';

// 搜索页面

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchKeyword> _searchKeywords = [];

  @override
  void initState() {
    _getSearchHistory();
    super.initState();
  }

  void _getSearchHistory() {
    AppConfig().getSearchKeywordDAO().findAllSearchKeyword().then((value) {
      setState(() {
        _searchKeywords.addAll(value);
        print(_searchKeywords.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: SAppBarSearch(
          onSearch: (key) {
            print(key);
            SearchKeyword keyword = SearchKeyword.keyword(key);
            AppConfig().getSearchKeywordDAO().insertSearchKeyword(keyword);
          },
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              var data = _searchKeywords[index];
              return Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text(
                      data.keyword,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: _searchKeywords.length),
      ),
    );
  }
}
