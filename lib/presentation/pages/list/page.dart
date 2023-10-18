import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/internal/di.dart';

import '../../routing/router.gr.dart';
import 'bloc.dart';

@RoutePage()
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListPageBloc>(
      create: (context) => getIt<ListPageBloc>(),
      child: BlocBuilder<ListPageBloc, ListPageBlocState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Todo List App')),
          floatingActionButton: FloatingActionButton(
            child: const Text(
              '+',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: () async {
              final bloc = context.read<ListPageBloc>();
              final wasCreated =
                  await context.router.push(const NewTodoRoute());
              if (wasCreated == true) bloc.updateList();
            },
          ),
          body: switch (state) {
            LoadingListPageState _ => const Center(
                child: CircularProgressIndicator(),
              ),
            DataListPageState s => SingleChildScrollView(
                child: Column(
                  children: [
                    if (s.list.isNotEmpty)
                      const ListDivider()
                    else
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text('There are no elements...'),
                      ),
                    ...s.list.map((e) => ListItem(
                          text: e.text,
                          isCompleted: e.completed,
                          onDeleteTap: () {
                            context.read<ListPageBloc>().delete(e);
                          },
                          onFinishTap: () {
                            context.read<ListPageBloc>().finish(e);
                          },
                        ))
                  ],
                ),
              ),
          },
        );
      }),
    );
  }
}

class ListItem extends StatelessWidget {
  final String text;
  final bool isCompleted;
  final VoidCallback onDeleteTap;
  final VoidCallback onFinishTap;

  const ListItem({
    super.key,
    required this.text,
    required this.isCompleted,
    required this.onDeleteTap,
    required this.onFinishTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              if (!isCompleted)
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: onFinishTap,
                  color: Colors.green,
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDeleteTap,
                color: Colors.red,
                padding: EdgeInsets.zero,
                iconSize: 18,
              ),
            ],
          ),
        ),
        const ListDivider(),
      ],
    );
  }
}

class ListDivider extends StatelessWidget {
  const ListDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1);
  }
}
