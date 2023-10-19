
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../internal/di.dart';
import 'bloc.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthPageBloc>(
      create: (context) => getIt<AuthPageBloc>(),
      child: BlocBuilder<AuthPageBloc, AuthPageState>(
        builder: (context, state) {
          return Scaffold();
        },
      ),
    );
  }
}

