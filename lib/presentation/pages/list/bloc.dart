import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/todo.dart';
import '../../../domain/usecases/interface.dart';

sealed class ListPageBlocState {}

class LoadingListPageState implements ListPageBlocState {
  const LoadingListPageState();
}

class DataListPageState implements ListPageBlocState {
  final List<Todo> list;

  DataListPageState(this.list);
}

@injectable
class ListPageBloc extends Cubit<ListPageBlocState> {
  final GetListUseCase _getListUseCase;
  final FinishTodoUseCase _finishTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  ListPageBloc(
    this._getListUseCase,
    this._finishTodoUseCase,
    this._deleteTodoUseCase,
  ) : super(const LoadingListPageState()) {
    updateList();
  }

  void updateList({bool? isCompleted}) {
    _getListUseCase().then((list) {
      if (isCompleted == null) {
        return emit(DataListPageState(list));
      }
      emit(DataListPageState(
          list.where((e) => e.completed == isCompleted).toList()));
    });
  }

  void finish(Todo todo) {
    if (todo.completed) return;
    emit(const LoadingListPageState());
    _finishTodoUseCase(todo.id);
    updateList();
  }

  void delete(Todo todo) {
    emit(const LoadingListPageState());
    _deleteTodoUseCase(todo.id);
    updateList();
  }
}
