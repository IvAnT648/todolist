
import 'package:injectable/injectable.dart';

import '../../data/model/todo.dart';
import '../../data/repository/interface.dart';
import 'interface.dart';

@Injectable(as: CreateTodoUseCase)
class CreateTodoUseCaseImpl implements CreateTodoUseCase {
  final TodoRepository _repository;

  CreateTodoUseCaseImpl(this._repository);

  @override
  Future<Todo> call(String text) async {
    return await _repository.createTodo(text);
  }
}

@Injectable(as: FinishTodoUseCase)
class FinishTodoUseCaseImpl implements FinishTodoUseCase {
  final TodoRepository _repository;

  FinishTodoUseCaseImpl(this._repository);

  @override
  Future<Todo> call(String id) async {
    return await _repository.finishTodo(id);
  }
}

@Injectable(as: DeleteTodoUseCase)
class DeleteTodoUseCaseImpl implements DeleteTodoUseCase {
  final TodoRepository _repository;

  DeleteTodoUseCaseImpl(this._repository);

  @override
  Future<void> call(String id) async {
    return await _repository.deleteTodo(id);
  }
}

@Injectable(as: GetListUseCase)
class GetListUseCaseImpl implements GetListUseCase {
  final TodoRepository _repository;

  GetListUseCaseImpl(this._repository);

  @override
  Future<List<Todo>> call() async {
    return await _repository.getList();
  }
}
