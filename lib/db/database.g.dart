// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FlutterDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FlutterDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FlutterDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FlutterDatabase extends FlutterDatabase {
  _$FlutterDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SearchKeywordDao? _searchKeywordDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SearchKeyword` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `keyword` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SearchKeywordDao get searchKeywordDao {
    return _searchKeywordDaoInstance ??=
        _$SearchKeywordDao(database, changeListener);
  }
}

class _$SearchKeywordDao extends SearchKeywordDao {
  _$SearchKeywordDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _searchKeywordInsertionAdapter = InsertionAdapter(
            database,
            'SearchKeyword',
            (SearchKeyword item) =>
                <String, Object?>{'id': item.id, 'keyword': item.keyword});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SearchKeyword> _searchKeywordInsertionAdapter;

  @override
  Future<List<SearchKeyword>> findAllSearchKeyword() async {
    return _queryAdapter.queryList('SELECT * FROM SearchKeyword',
        mapper: (Map<String, Object?> row) =>
            SearchKeyword(row['id'] as int?, row['keyword'] as String));
  }

  @override
  Future<void> insertSearchKeyword(SearchKeyword keyword) async {
    await _searchKeywordInsertionAdapter.insert(
        keyword, OnConflictStrategy.abort);
  }
}
