import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'package:dbtodo/models/task.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

import 'package:http/http.dart' as http;

import '../constants.dart';

// class DBHelper {
//   static Database _db;
//   static const String TEXT = "text";
//   static const String ISDONE = "isDone";
//   static const String ID = "id";
//   static const String TABLE = "Task";
//   static const String DB_NAME = "dbtodo.db";

//   Future<Database> get db async {
//     if (db != null) {
//       return db;
//     }

//     _db = await initDb();
//     return _db;
//   }

//   initDb() async {
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, DB_NAME);
//     var db = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return db;
//   }

//   _onCreate(Database db, int version) async {
//     await db.execute(
//         'CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $TEXT TEXT, $ISDONE INTEGER)');
//   }

//   Future<Task> save(Task task) async {
//     var dbClient = await db;
//     task.id = await dbClient.insert(TABLE, task.toMap());
//     return task;
//   }

//   Future<List<Task>> getTasks() async {
//     var dbClient = await db;
//     List<Map> maps = await dbClient.query(TABLE, columns: [ID, TEXT, ISDONE]);
//     // List<Map> maps =await dbClient.rawQuery('SELECT * FROM $TABLE');

//     List<Task> tasks = [];

//     if (maps.length > 0) {
//       for (int i = 0; i < maps.length; i++) {
//         tasks.add(Task.fromMap(maps[i]));
//       }
//     }

//     return tasks;
//   }

//   Future<int> delete(int id) async {
//     var dbClient = await db;
//     return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
//   }

//   Future<int> update(Task task) async {
//     var dbClient = await db;
//     return await dbClient
//         .update(TABLE, task.toMap(), where: '$ID = ?', whereArgs: [task.id]);
//   }

//   Future close() async {
//     var dbClient = await db;
//     dbClient.close();
//   }
// }

// Database _db;

// class DBHelper2 {
//   static const String USERID = "userID";
//   static const String USERNAME = "userName";
//   static const String USERPW = "userPW";
//   static const String TABLE = "users";
//   static const String DB_NAME = "users.db";

//   // Future cleanDB () async {
//   //   var dbClient =await db;
//   //   dbClient.rawDelete('DELETE FROM $TABLE');
//   // }

//   // Future<Database> get db async {
//   //   if (_db != null) {
//   //     return _db;
//   //   }

//   //   _db = await initDb();
//   //   return _db;
//   // }

//   Future<String> getDBPath(String dbName) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, dbName);

//     if (await io.Directory(dirname(path)).exists()) {
//       // await deleteDatabase(path);
//     } else {
//       await io.Directory(dirname(path)).create(recursive: true);
//     }
//     return path;
//   }

//   Future<void> initDb() async {
//     final path = await getDBPath(DB_NAME);
//     _db = await openDatabase(path, version: 1, onCreate: onCreate);

//     print(_db);

//     // io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     // String path = join(documentsDirectory.path, DB_NAME);
//     // var db =
//     //     await openDatabase(path, version: 1, onCreate: _onCreate, onOpen: (db) {
//     //   print('OPENED');
//     // });
//     return _db;
//   }

//   Future<void> onCreate(Database db, int version) async {
//     await db.execute(
//         'CREATE TABLE $TABLE ($USERID INTEGER PRIMARY KEY, $USERPW TEXT, $USERNAME INTEGER)');
//   }

//   // Future<User> save(User user) async {
//   //   var dbClient = await db;
//   //   user.userID = await dbClient.insert(TABLE, user.toMap());
//   //   return user;
//   // }

//   // Future<User> getUser(int userID) async {
//   //   var dbClient = await db;
//   //   // List<Map> maps = await dbClient.query(TABLE, columns: [ID, TEXT, ISDONE]);

//   //   if (dbClient.isOpen) {
//   //     List<Map> maps = await dbClient
//   //         .rawQuery('SELECT * FROM $TABLE WHERE $USERID = $userID');

//   //     User user;
//   //     if (maps.length > 0) {
//   //       user = User.fromMap(maps[0]);
//   //     }

//   //     return user;
//   //   } else {
//   //     print('closed db');
//   //   }
//   //   return null;
//   // }

//   // Future<bool> isUser(int userID) async {
//   //   var dbClient = await db;

//   //   if (dbClient.isOpen) {
//   //     List<Map> maps = await dbClient
//   //         .rawQuery('SELECT $USERNAME FROM $TABLE WHERE $USERID = $userID');

//   //     for (int i = 0; i < maps.length; i++) {
//   //       User user = User.fromMap(maps[i]);
//   //       if (user.userID == userID) {
//   //         return true;
//   //       }

//   //       return false;
//   //     }
//   //   } else {
//   //     print('closed');
//   //     return null;
//   //   }

//   //   return false;
//   // }

//   // Future<List<User>> getAllUsers() async {
//   //   var dbClient = await db;

//   //   if (dbClient.isOpen) {
//   //     List<User> users = [];

//   //     List<Map> maps = await dbClient.rawQuery('SELECT * FROM $TABLE');

//   //     for (int i = 0; i < maps.length; i++) {
//   //       users.add(User.fromMap(maps[i]));
//   //     }

//   //     return users;
//   //   } else {
//   //     print('its closed');
//   //     return null;
//   //   }
//   // }

//   // Future close() async {
//   //   var dbClient = await db;
//   //   dbClient.close();
//   // }
// }

// class RepService {
//   static Future<List<User>> getAllUsers() async {
//     final sql = '''SELECT * FROM ${DBHelper2.TABLE}''';
//     final data = await _db.rawQuery(sql);

//     List<User> users = List();

//     for (final node in data) {
//       final user = User.fromJson(node);
//       users.add(user);
//     }

//     return users;
//   }

//   static Future<User> getUser(int id) async {
//     final sql = '''SELECT * FROM ${DBHelper2.TABLE}
//         WHERE ${DBHelper2.USERID} = $id''';
//     final data = await _db.rawQuery(sql);

//     final user = User.fromJson(data[0]);
//     return user;
//   }

//   static Future<void> addUser(User user) async {
//     final sql = '''INSERT INTO ${DBHelper2.TABLE}
//     (
//       ${DBHelper2.USERID},
//       ${DBHelper2.USERPW},
//       ${DBHelper2.USERNAME}
//     )
//     VALUES
//     (
//       ${user.userID},
//       ${user.userPW},
//       "${user.userName}"
//     )''';

//     final result = await _db.rawQuery(sql);
//     // DBHelper2.DBLogger();
//   }

//   // static Future<void> deleteUser(){}
//   // static Future<void> updateUser(){}

//   static Future<void> countUsers() async {
//     final data =
//         await _db.rawQuery('''SELECT COUNT(*) FROM ${DBHelper2.TABLE}''');

//     int intCount = data[0].values.elementAt(0);

//     return intCount;
//   }
// }

class DBHelperFunctions {
  static Future<List<Task>> getTasks() async {
    Map data;
    List taskData;

    print('get tasks started');
    http.Response response = await http.get("http://localhost:4000/api/tasks/");
    data = json.decode(response.body);
    taskData = data['tasks'];

    print(taskData);

    List<Task> tasks = [];
    for (int i = 0; i < data.length; i++) {
      tasks[i] = Task.fromMap(data[i]);
    }
    // setState(() {
    //   usersData = data['users'];
    // });

    print(tasks[0].text);
    return tasks;
  }

  static Future addTask() async {}
}
