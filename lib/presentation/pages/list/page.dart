import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/internal/di.dart';

import '../../routing/router.gr.dart';
import 'bloc.dart';

enum FilterByCompletion {
  all('All'),
  completed('Completed'),
  uncompleted('Uncompleted');

  const FilterByCompletion(this.text);

  final String text;
}

@RoutePage()
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _completionFilterItems = FilterByCompletion.values
      .map((e) => DropdownMenuItem(
            value: e,
            child: Text(e.text),
          ))
      .toList();

  FilterByCompletion _filterByCompletion = FilterByCompletion.all;

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
              if (wasCreated != true) return;
              switch (_filterByCompletion) {
                case FilterByCompletion.all:
                  bloc.updateList();
                  break;
                case FilterByCompletion.completed:
                  bloc.updateList(isCompleted: true);
                  break;
                case FilterByCompletion.uncompleted:
                  bloc.updateList(isCompleted: false);
                  break;
              }
            },
          ),
          body: switch (state) {
            LoadingListPageState _ => const Center(
                child: CircularProgressIndicator(),
              ),
            DataListPageState s => SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Show'),
                        const SizedBox(width: 20),
                        DropdownButton(
                          value: _filterByCompletion,
                          items: _completionFilterItems,
                          onChanged: (v) {
                            if (v == null || _filterByCompletion == v) return;
                            _filterByCompletion = v;
                            final bloc = context.read<ListPageBloc>();
                            switch (_filterByCompletion) {
                              case FilterByCompletion.all:
                                bloc.updateList();
                                break;
                              case FilterByCompletion.completed:
                                bloc.updateList(isCompleted: true);
                                break;
                              case FilterByCompletion.uncompleted:
                                bloc.updateList(isCompleted: false);
                                break;
                            }
                          },
                        ),
                      ],
                    ),
                    const ListDivider(),
                    if (s.list.isEmpty)
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
