import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/hello_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('object');
    // show a SnackBar when a provider state changes.
    // not when the build method is called
    ref.listen<StateController<int>>(counterStateProvider.state,
        (previous, current) {
      print('current.state: ${current.state}');
    });
    return Scaffold(
      body: Center(
        child: Text('${ref.watch(counterStateProvider)}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterStateProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
