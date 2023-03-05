import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/counter_controller.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('build call');
    // show a SnackBar when a provider state changes.
    // not when the build method is called
    // ref.listen<StateController<int>>(counterProvider.notifier,
    //     (previous, current) {
    //   log('current.state: ${current.state}');
    // });
    final counter = ref.watch(counterControllerProvider);
    return Scaffold(
      body: Center(
        child: Text('$counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(counterControllerProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
