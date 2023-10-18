// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:todolist/presentation/pages/list/page.dart' as _i1;
import 'package:todolist/presentation/pages/new/page.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ListRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ListPage(),
      );
    },
    NewTodoRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.NewTodoPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ListPage]
class ListRoute extends _i3.PageRouteInfo<void> {
  const ListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.NewTodoPage]
class NewTodoRoute extends _i3.PageRouteInfo<void> {
  const NewTodoRoute({List<_i3.PageRouteInfo>? children})
      : super(
          NewTodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewTodoRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
