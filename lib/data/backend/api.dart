
import 'package:injectable/injectable.dart';
import 'package:todolist/data/model/todo.dart';

import 'interface.dart';

@Injectable(as: BackendApi)
class TodoBackendApi implements BackendApi {
  @override
  Future<Todo> createTodo(String text) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<Todo> finishTodo(String id) {
    // TODO: implement finishTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

}
