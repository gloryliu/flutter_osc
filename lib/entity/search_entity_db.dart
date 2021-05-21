import 'package:floor/floor.dart';

// 搜索历史 数据库相关操作

@entity
class SearchKeyword {
  @primaryKey
  final int id;
  final String keyword;

  SearchKeyword(this.id, this.keyword);
}

@dao
abstract class SearchKeywordDao {
  @insert
  Future<void> insertSearchKeyword(SearchKeyword keyword);
}

