// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:todolist/data/backend/api.dart' as _i7;
import 'package:todolist/data/backend/interface.dart' as _i6;
import 'package:todolist/data/repository/interface.dart' as _i8;
import 'package:todolist/data/repository/todo.dart' as _i9;
import 'package:todolist/domain/usecases/auth.dart' as _i5;
import 'package:todolist/domain/usecases/interface.dart' as _i4;
import 'package:todolist/domain/usecases/todo.dart' as _i11;
import 'package:todolist/presentation/pages/auth/bloc.dart' as _i10;
import 'package:todolist/presentation/pages/list/bloc.dart' as _i12;
import 'package:todolist/presentation/pages/new/bloc.dart' as _i13;
import 'package:todolist/presentation/routing/router.dart' as _i3;

const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.factory<_i4.AuthorizeUseCase>(() => _i5.AuthorizeUseCaseImpl());
    gh.factory<_i6.BackendApi>(
      () => _i7.BackendApiStub(),
      registerFor: {_dev},
    );
    gh.factory<_i8.TodoRepository>(
        () => _i9.TodoRepositoryImpl(gh<_i6.BackendApi>()));
    gh.factory<_i10.AuthPageBloc>(
        () => _i10.AuthPageBloc(gh<_i4.AuthorizeUseCase>()));
    gh.factory<_i4.CreateTodoUseCase>(
        () => _i11.CreateTodoUseCaseImpl(gh<_i8.TodoRepository>()));
    gh.factory<_i4.DeleteTodoUseCase>(
        () => _i11.DeleteTodoUseCaseImpl(gh<_i8.TodoRepository>()));
    gh.factory<_i4.FinishTodoUseCase>(
        () => _i11.FinishTodoUseCaseImpl(gh<_i8.TodoRepository>()));
    gh.factory<_i4.GetListUseCase>(
        () => _i11.GetListUseCaseImpl(gh<_i8.TodoRepository>()));
    gh.factory<_i12.ListPageBloc>(() => _i12.ListPageBloc(
          gh<_i4.GetListUseCase>(),
          gh<_i4.FinishTodoUseCase>(),
          gh<_i4.DeleteTodoUseCase>(),
        ));
    gh.factory<_i13.NewTodoPageBloc>(
        () => _i13.NewTodoPageBloc(gh<_i4.CreateTodoUseCase>()));
    return this;
  }
}
