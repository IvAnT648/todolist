
import '../model/todo.dart';

abstract class TodoRepository {
  Future<void> createTodo(String text);
  Future<void> finishTodo(String id);
  Future<void> deleteTodo(String id);
  Future<List<Todo>> getList();
}
