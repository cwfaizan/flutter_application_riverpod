import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/login_provider.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);
  final noTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = ref.watch(loginProvider.notifier);
    log('Faizan Abbas ${w.state}');
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: noTextEditingController..text = '1',
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(loginProvider.notifier)
                    .toggle(int.parse(noTextEditingController.text));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
