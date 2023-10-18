
import '../../data/model/todo.dart';

abstract class SetAuthenticationUseCase {
  void call();
}

abstract class AuthorizeUseCase {
  void call();
}

abstract class CreateTodoUseCase {
  Future<void> call(String text);
}

abstract class FinishTodoUseCase {
  Future<void> call(String id);
}

abstract class DeleteTodoUseCase {
  Future<void> call(String id);
}

abstract class GetListUseCase {
  Future<List<Todo>> call();
}
