
import 'package:injectable/injectable.dart';
import 'package:todolist/data/model/todo.dart';

import '../../internal/di.dart';
import 'interface.dart';

@Injectable(as: BackendApi, env: [Env.dev])
class BackendApiStub implements BackendApi {
  static final _list = <Todo>[];
  static int _id = 0;
  
  @override
  Future<Todo> createTodo(String text) async {
    final todo = Todo(
      id: (++_id).toString(),
      text: text,
      completed: false,
    );
    _list.add(todo);
    return todo;
  }

  @override
  Future<void> deleteTodo(String id) async {
    _list.removeWhere((e) => e.id == id);
  }

  @override
  Future<Todo> finishTodo(String id) async {
    for (final e in _list) {
      if (e.id == id) {
        e.completed = true;
        return e;
      }
    }
    throw Exception('Todo with the id $id not found.');
  }

  @override
  Future<List<Todo>> getList() async {
    return _list;
  }
}
