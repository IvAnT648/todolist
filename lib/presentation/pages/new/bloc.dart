import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/interface.dart';

sealed class NewTodoPageState {}

class NewTodoPageFormState implements NewTodoPageState {}
class NewTodoPageLoadingState implements NewTodoPageState {}
class NewTodoPageSuccessState implements NewTodoPageState {}
class NewTodoPageFailureState implements NewTodoPageState {
  final String? msg;

  NewTodoPageFailureState(this.msg);
}

@injectable
class NewTodoPageBloc extends Cubit<NewTodoPageState> {
  final CreateTodoUseCase _createTodoUseCase;

  NewTodoPageBloc(this._createTodoUseCase) : super(NewTodoPageFormState());

  Future<bool> createNewTodo(String text) async {
    try {
      if (text.isEmpty) {
        emit(NewTodoPageFailureState('Note can\'t be empty'));
        return false;
      }
      emit(NewTodoPageLoadingState());
      await _createTodoUseCase(text.trim());
      return true;
    } catch (e) {
      emit(NewTodoPageFailureState(e.toString()));
      return false;
    }
  }
}
