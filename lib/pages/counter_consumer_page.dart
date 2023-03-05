import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_riverpod/models/facts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/hello_provider.dart';

class CounterConsumerPage extends ConsumerWidget {
  const CounterConsumerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('build call');
    AsyncValue<Facts> fp = ref.watch(factsProvider);
    return Scaffold(
      body: fp.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('error $error'),
            const Text('************'),
            Text('stackTrace $stackTrace'),
          ],
        )),
        data: (facts) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('facts ${facts.language}'),
              Text('facts 2 ${fp.value?.sourceUrl}'),
              Consumer(
                builder: (context, ref, child) {
                  bool ch = ref.watch(passwordStateProvider);
                  log('Consumer call');
                  return Column(
                    children: [
                      Text('$ch'),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(passwordStateProvider.notifier).state = !ch;
                        },
                        child: const Text('Click'),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
