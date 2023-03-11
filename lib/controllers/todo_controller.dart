import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/todo.dart';
import '../networks/dio.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {
  Future<List<Todo>> _fetchTodo() async {
    final res = await ref.watch(dioProvider).get('/todos');
    print('*********************************************');
    Map<String, dynamic> mp = jsonDecode(res.toString());
    print(mp.toString());
    final todos = jsonDecode(res.toString()) as List<Map<String, dynamic>>;
    // print(Todos);
    return todos.map((todo) => Todo.fromJson(todo)).toList();
  }

  @override
  FutureOr<List<Todo>> build() {
    return _fetchTodo();
  }

  // @override
  // List<Todo> build() {
  //   return [];
  // }

  // void addTodo(Todo todo) {
  //   state = [...state, todo];
  // }

  // void removeTodo(String todoId) {
  //   state = state.where((e) => e.id != todoId).toList();
  // }

  // void toggle(String todoId) {
  //   state = [
  //     for (final todo in state)
  //       if (todo.id == todoId)
  //         todo.copyWith(completed: !todo.completed)
  //       else
  //         todo,
  //   ];
  // }

  // List<Todo> completedTodos() {
  //   // we return only the completed todos
  //   return state.where((todo) => todo.completed).toList();
  // }
}

// @riverpod
// List<Todo> completedTodos(CompletedTodosRef ref) {
//   final todos = ref.watch(todoControllerProvider);
//   // we return only the completed todos
//   return todos.where((todo) => todo.completed).toList();
// }
