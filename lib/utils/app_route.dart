import 'package:flutter/material.dart';

import '../pages/counter_page.dart';
import '../pages/edit_todo_page.dart';
import '../pages/error_page.dart';
import '../pages/todo_page.dart';

class AppRoute {
  static const String splash = '/';
  static const String counterPage = 'counterPage';
  static const String todoPage = 'todoPage';
  static const String editTodoPage = 'editTodoPage';
  static const String error = 'error';

  // home: const HelloPage(),
  // home: const YearPage(),
  // home: const CounterConsumerPage(),
  // home: const CounterPage(),

  AppRoute._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case todoPage:
        return MaterialPageRoute(builder: (_) => TodoPage());
      case counterPage:
        return MaterialPageRoute(builder: (_) => CounterPage());
      case editTodoPage:
        return MaterialPageRoute(builder: (_) => EditTodoPage());
      case error:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }

  static void push(BuildContext context, final nextScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  static void pushNamed(BuildContext context, final routeName,
      {Object? arguments}) {
    Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  static void goNamed(BuildContext context, final routeName,
      {Object? arguments}) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
