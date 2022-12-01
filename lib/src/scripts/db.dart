import 'task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'tareas.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE tareas (id INTEGER PRIMARY KEY, asunto TEXT ,contexto TEXT, prioridad TEXT)');
    }, version: 1);
  }
  static Future<int> insert(newTarea tarea) async {
    Database database = await _openDB();
    print("funciona");
    return database.insert("tareas", tarea.toMap());
  }
  static Future<int> delete(newTarea tarea) async {
    Database database = await _openDB();
    return database.delete("tareas",where: 'id = ?',whereArgs: [tarea.id]);
  }
  static Future<int> update(newTarea tarea) async {
    Database database = await _openDB();
    return database.update("tareas", tarea.toMap(),where: 'where id = ?',whereArgs:[tarea.id]);
  }
  static Future<List<newTarea>> getData() async{
    Database database = await _openDB();
    final List<Map<String,dynamic>> tareasMap =  await database.query("tareas");
    return List.generate(tareasMap.length, (i) => newTarea(
        tareasMap[i]['id'],
        tareasMap[i]['asunto'],
        tareasMap[i]['contexto'],
        tareasMap[i]['prioridad'],
    ));
  }
}
