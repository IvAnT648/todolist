import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../internal/di.dart';
import 'bloc.dart';

@RoutePage()
class NewTodoPage extends StatefulWidget {
  const NewTodoPage({Key? key}) : super(key: key);

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewTodoPageBloc>(
      create: (context) => getIt<NewTodoPageBloc>(),
      child: BlocBuilder<NewTodoPageBloc, NewTodoPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Create a new task'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    TextField(
                      controller: _textController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Type a note here...',
                        border: const OutlineInputBorder(),
                        errorText: state is NewTodoPageFailureState ? state.msg : null
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      child: const Text('Create'),
                      onPressed: () async {
                        final router = context.router;
                        final result = await context
                            .read<NewTodoPageBloc>()
                            .createNewTodo(_textController.text);
                        if (result) router.pop(true);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
