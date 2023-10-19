
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/interface.dart';

sealed class AuthPageState {}
class InitialPageState implements AuthPageState {}

@injectable
class AuthPageBloc extends Cubit<AuthPageState> {
  final AuthorizeUseCase _authorizeUseCase;

  AuthPageBloc(this._authorizeUseCase) : super(InitialPageState()) {
    authorize();
  }

  void authorize() => _authorizeUseCase();
}
