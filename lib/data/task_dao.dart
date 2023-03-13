import 'package:sqflite/sqflite.dart';
import '../components/task.dart';
import 'database.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INT, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';

  static const String _name = 'name';
  static const String _difficulty = '_difficulty';
  static const String _image = 'image';
  // save                  = Create
  // findAll, toList, find = Read
  //    findAll, toList    = Update
  //                       = Delete
  save(Task taskss) async {
    print('Iniciando o save: ');
    final Database db = await getDatabase();
    var itemExists = await find(taskss.name);
    Map<String, dynamic> taskMap = toMap(taskss);

    if (itemExists.isEmpty) {
      print('A tarefa nao existe');
      return await db.insert(_tablename, taskMap);
    } else {
      print('A tarefa ja existe');
      return await db.update(
          _tablename, taskMap,
          where: '$_name = ?',
          whereArgs: [taskss.name]);
    }
  }

  Map<String, dynamic> toMap(Task taskss){
    print('Convertendo Tarefa em Map:');
    final Map<String, dynamic> mapTaskS = Map();
    mapTaskS[_name] = taskss.name;
    mapTaskS[_difficulty] = taskss.dificul;
    mapTaskS[_image] = taskss.photo;
    print('Mapa de Tarefas: $mapTaskS');
    return mapTaskS;
  }

  Future<List<Task>> findAll() async {
    print('Entrando no FindAll: ');
    final Database bD = await getDatabase();
    final List<Map<String, dynamic>> results = await bD.query(_tablename);
    print('Procurando dados... encontrado: $results');
    return toList(results);
  }

  List<Task> toList(List<Map<String, dynamic>> mapTasks) {
    print('Convertendo para Lista');
    final List<Task> taskS = [];
    for (Map<String, dynamic> line in mapTasks) {
      final Task newTask = Task(line[_name], line[_image], line[_difficulty]);
      taskS.add(newTask);
    }
    print('List de Tarefas $taskS');
    return taskS;
  }

  Future<List<Task>> find(String nameTask) async {
    print('Acessando Find:');
    final Database bD = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bD.query(_tablename, where: '$_name = ?', whereArgs: [nameTask]);
    print('Tarefa Encontrada: ${toList(result)}');
    return (toList(result));
  }

  delete(String namedTasks) async {
    print('Deletando Tarefe:');
    final Database db = await getDatabase();
    return db.delete(_tablename, where: '$_name = ?', whereArgs: [namedTasks]);
  }
}
