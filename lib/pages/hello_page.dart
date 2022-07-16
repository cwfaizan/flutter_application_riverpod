import 'package:flutter/material.dart';
import 'package:flutter_application_riverpod/providers/hello_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelloPage extends ConsumerWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
          ref.watch(helloProvider),
        ),
      ),
    );
  }
}
