
import 'package:injectable/injectable.dart';

import '../backend/interface.dart';
import '../model/todo.dart';
import 'interface.dart';

@Injectable(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final BackendApi _backendApi;

  TodoRepositoryImpl(this._backendApi);

  @override
  Future<Todo> createTodo(String text) async {
    return await _backendApi.createTodo(text);
  }

  @override
  Future<Todo> finishTodo(String id) async {
    return await _backendApi.finishTodo(id);
  }

  @override
  Future<void> deleteTodo(String id) async {
    return await _backendApi.deleteTodo(id);
  }

  @override
  Future<List<Todo>> getList() async {
    return await _backendApi.getList();
  }
}
