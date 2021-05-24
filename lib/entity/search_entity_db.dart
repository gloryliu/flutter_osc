import 'package:floor/floor.dart';

// 搜索历史 数据库相关操作

@entity
class SearchKeyword {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String keyword = '';

  SearchKeyword(this.id, this.keyword);

  SearchKeyword.keyword(String keyword) {
    this.keyword = keyword;
  }

}

@dao
abstract class SearchKeywordDao {
  @insert
  Future<void> insertSearchKeyword(SearchKeyword keyword);

  @Query('SELECT * FROM SearchKeyword')
  Future<List<SearchKeyword>> findAllSearchKeyword();
}

