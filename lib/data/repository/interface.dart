
import '../model/todo.dart';

abstract class TodoRepository {
  Future<Todo> createTodo(String text);
  Future<Todo> finishTodo(String id);
  Future<void> deleteTodo(String id);
  Future<List<Todo>> getList();
}

abstract class AuthRepository {
  Future<bool> authorizeLocal();
}
