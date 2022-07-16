import 'package:flutter/material.dart';
import 'package:flutter_application_riverpod/pages/counter_page.dart';
import 'package:flutter_application_riverpod/pages/hello_page.dart';
import 'package:flutter_application_riverpod/pages/year_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HelloPage(),
      // home: const YearPage(),
      home: const CounterPage(),
    );
  }
}
