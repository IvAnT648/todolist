import 'package:flutter/material.dart';
import 'package:todolist/presentation/routing/router.dart';

import 'internal/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDI(Env.dev);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TODO List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
