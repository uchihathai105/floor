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

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

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
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
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
  _$FlutterDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao _taskDaoInstance;

  MailDao _mailDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `Task` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `message` TEXT)');
        await database.execute(
            'CREATE VIRTUAL TABLE IF NOT EXISTS `mail` USING fts4(`rowid` INTEGER, `text` TEXT, PRIMARY KEY (`rowid`), tokenize=porter)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }

  @override
  MailDao get mailDao {
    return _mailDaoInstance ??= _$MailDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'Task',
            (Task item) =>
                <String, dynamic>{'id': item.id, 'message': item.message},
            changeListener),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'Task',
            ['id'],
            (Task item) =>
                <String, dynamic>{'id': item.id, 'message': item.message},
            changeListener),
        _taskDeletionAdapter = DeletionAdapter(
            database,
            'Task',
            ['id'],
            (Task item) =>
                <String, dynamic>{'id': item.id, 'message': item.message},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Task> _taskInsertionAdapter;

  final UpdateAdapter<Task> _taskUpdateAdapter;

  final DeletionAdapter<Task> _taskDeletionAdapter;

  @override
  Future<Task> findTaskById(int id) async {
    return _queryAdapter.query('SELECT * FROM task WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) =>
            Task(row['id'] as int, row['message'] as String));
  }

  @override
  Future<List<Task>> findAllTasks() async {
    return _queryAdapter.queryList('SELECT * FROM task',
        mapper: (Map<String, dynamic> row) =>
            Task(row['id'] as int, row['message'] as String));
  }

  @override
  Stream<List<Task>> findAllTasksAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM task',
        queryableName: 'Task',
        isView: false,
        mapper: (Map<String, dynamic> row) =>
            Task(row['id'] as int, row['message'] as String));
  }

  @override
  Future<void> insertTask(Task task) async {
    await _taskInsertionAdapter.insert(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertTasks(List<Task> tasks) async {
    await _taskInsertionAdapter.insertList(tasks, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTask(Task task) async {
    await _taskUpdateAdapter.update(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTasks(List<Task> task) async {
    await _taskUpdateAdapter.updateList(task, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _taskDeletionAdapter.delete(task);
  }

  @override
  Future<void> deleteTasks(List<Task> tasks) async {
    await _taskDeletionAdapter.deleteList(tasks);
  }
}

class _$MailDao extends MailDao {
  _$MailDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _mailInsertionAdapter = InsertionAdapter(
            database,
            'mail',
            (Mail item) =>
                <String, dynamic>{'rowid': item.id, 'text': item.text},
            changeListener),
        _mailUpdateAdapter = UpdateAdapter(
            database,
            'mail',
            ['rowid'],
            (Mail item) =>
                <String, dynamic>{'rowid': item.id, 'text': item.text},
            changeListener),
        _mailDeletionAdapter = DeletionAdapter(
            database,
            'mail',
            ['rowid'],
            (Mail item) =>
                <String, dynamic>{'rowid': item.id, 'text': item.text},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _mailMapper = (Map<String, dynamic> row) =>
      Mail(row['rowid'] as int, row['text'] as String);

  final InsertionAdapter<Mail> _mailInsertionAdapter;

  final UpdateAdapter<Mail> _mailUpdateAdapter;

  final DeletionAdapter<Mail> _mailDeletionAdapter;

  @override
  Future<Mail> findMailById(int id) async {
    return _queryAdapter.query('SELECT * FROM mailinfo WHERE id = ?',
        arguments: <dynamic>[id], mapper: _mailMapper);
  }

  @override
  Future<Mail> findMailByKey(String key) async {
    return _queryAdapter.query('SELECT * FROM mailinfo WHERE text match "?"',
        arguments: <dynamic>[key], mapper: _mailMapper);
  }

  @override
  Future<List<Mail>> findAllMails() async {
    return _queryAdapter.queryList('SELECT * FROM mailinfo',
        mapper: _mailMapper);
  }

  @override
  Stream<List<Mail>> findAllMailsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM mailinfo',
        queryableName: 'mail', isView: false, mapper: _mailMapper);
  }

  @override
  Future<void> insertMail(Mail mailInfo) async {
    await _mailInsertionAdapter.insert(mailInfo, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertMails(List<Mail> mailInfo) async {
    await _mailInsertionAdapter.insertList(mailInfo, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMail(Mail mailInfo) async {
    await _mailUpdateAdapter.update(mailInfo, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMails(List<Mail> mailInfo) async {
    await _mailUpdateAdapter.updateList(mailInfo, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMail(Mail mailInfo) async {
    await _mailDeletionAdapter.delete(mailInfo);
  }

  @override
  Future<void> deleteMails(List<Mail> mailInfo) async {
    await _mailDeletionAdapter.deleteList(mailInfo);
  }
}
