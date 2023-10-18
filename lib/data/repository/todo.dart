
import 'package:injectable/injectable.dart';

import '../model/todo.dart';
import 'interface.dart';

@Injectable(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<void> createTodo(String text) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<void> finishTodo(String id) {
    // TODO: implement finishTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }
}
