import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';
import '../controllers/todo_controller.dart';
import '../utils/app_route.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    List<Todo> todos = ref.watch(todoControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        actions: [
          IconButton(
            onPressed: () {
              AppRoute.pushNamed(context, AppRoute.editTodoPage);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: todos.isNotEmpty
          ? ListView(
              children: [
                for (final todo in todos)
                  CheckboxListTile(
                    value: todo.completed,
                    // When tapping on the todo, change its completed status
                    onChanged: (value) => ref
                        .read(todoControllerProvider.notifier)
                        .toggle(todo.id),
                    title: Text(todo.description),
                  ),
              ],
            )
          : const Center(
              child: Text('No Item Added Yet'),
            ),
    );
  }
}
