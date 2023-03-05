// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$completedTodosHash() => r'3d52fc828708a0109c9365647a4a4e6288cfe9e5';

/// See also [completedTodos].
@ProviderFor(completedTodos)
final completedTodosProvider = AutoDisposeProvider<List<Todo>>.internal(
  completedTodos,
  name: r'completedTodosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completedTodosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CompletedTodosRef = AutoDisposeProviderRef<List<Todo>>;
String _$todoControllerHash() => r'e6f9eb6daaebc4ee9f0de4a75cb591123e27a6a0';

/// See also [TodoController].
@ProviderFor(TodoController)
final todoControllerProvider =
    AutoDisposeNotifierProvider<TodoController, List<Todo>>.internal(
  TodoController.new,
  name: r'todoControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoController = AutoDisposeNotifier<List<Todo>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
