import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/todo.dart';
import '../../../domain/usecases/interface.dart';

sealed class ListPageBlocState {}

class LoadingListPageState implements ListPageBlocState {
  const LoadingListPageState();
}

class DataListPageState implements ListPageBlocState {
  final List<Todo> data;

  DataListPageState(this.data);
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
    _getListUseCase().then((list) => emit(DataListPageState(list)));
  }
}
