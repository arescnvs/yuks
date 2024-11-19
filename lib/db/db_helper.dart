import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._();
  static Database? _database;

  DBHelper._();

  factory DBHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            username TEXT UNIQUE,
            password TEXT
          )
        ''');
        db.execute('''CREATE TABLE questions (
          id INTEGER PRIMARY KEY,
          title TEXT,
          content TEXT,
          subject TEXT,
          upvotes INTEGER,
          downvotes INTEGER,
          isUpvoted INTEGER,
          isDownvoted INTEGER
        )''');
        db.execute('''CREATE TABLE answers (
          id INTEGER PRIMARY KEY,
          questionId INTEGER,
          content TEXT,
          upvotes INTEGER,
          downvotes INTEGER,
          isUpvoted INTEGER,
          isDownvoted INTEGER,
          FOREIGN KEY (questionId) REFERENCES questions (id)
        )''');
      },
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('users', user);
  }

  Future<Map<String, dynamic>?> getUser(String username) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    return result.isNotEmpty ? result.first : null;
  }
}
