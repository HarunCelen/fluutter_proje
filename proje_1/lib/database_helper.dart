import 'package:proje_1/models/ogrenci_model.dart';
import 'package:sqflite/sqflite.dart';

final String tableName = 'student';
final int id = id;
final String name = "name";
final String lastName = "lastName";
final int seviye = seviye;

class DatabaseHelper {
  late Database _database;
  open() async {
    _database = await openDatabase('local__database.db', version: 1,
        onCreate: (Database _database, int version) async {
      _database.execute(
          'CREATE TABLE $tableName ( $id INTEGER PRIMARY KEY AUTOINCREMENT, $name VARCH6AR(20),$lastName VARCHAR(20),$seviye INTEGER)');
    });
  }

  Future<List<Students>> getStudentss() async {
    var _databaseClient = await _database;
    var result = await _databaseClient.query("Students", orderBy: "name");
    return result.map((data) => Students.fromMap(data)).toList();
  }

  /*Future<int> insertStudents(Students students) async {
    var databaseClient = await _database;
    return await databaseClient.insert("Students", Students.toMap());
  }*/

  Future<int> updateStudents(Students Students) async {
    var _databaseClient = await _database;
    return await _databaseClient.update("Students", Students.toMap(),
        where: "id=?", whereArgs: [Students.id]);
  }

  Future<int> removeStudents(int id) async {
    var _databaseClient = await _database;
    return await _databaseClient
        .delete("Students", where: "id=?", whereArgs: [id]);
  }
}
