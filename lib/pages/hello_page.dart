import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/hello_provider.dart';

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
