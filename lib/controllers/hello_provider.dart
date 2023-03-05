import 'dart:convert';

import 'package:flutter_application_riverpod/models/facts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../networks/network_client.dart';

// *** Providers Types ***
// Provider<String>
// StateProvider<int>
// StateNotifierProvider<Clock, DateTime> *** with *** class Clock extends StateNotifier<DateTime>
// ChangeNotifierProvider *** with *** ChangeNotifier
// FutureProvider<int>
// FutureProvider.autoDispose
// StreamProvider<int>
// StreamProvider.autoDispose<int>
// StreamProvider.autoDispose.family<int, int> *** pass an additional argument ***

final helloProvider = Provider<String>((ref) {
  return 'Hello Faizan';
});

final yearProvider = Provider<int>((ref) {
  return 2022;
});

// reset state
// ref.invalidate(counterStateProvider)
final counterStateProvider = StateProvider<int>((ref) {
  int a = 0;
  return a;
});

final passwordStateProvider = StateProvider<bool>((ref) {
  return true;
});

// you can change state of provider
// ref.read(helloStateProvider.notifier).state = 'Hello Faizan',
// ref.read(helloStateProvider.state).state = 'Hello Faizan',
// ref.read(helloStateProvider).state
// reset state
// ref.invalidate(counterStateProvider)
final helloStateProvider = StateProvider<String>((ref) {
  return 'Hello';
});

final dateTimeProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final ncProvider = Provider.autoDispose<NetworkClient>((ref) {
  return NetworkClient();
});

final factsProvider = FutureProvider.autoDispose<Facts>((ref) async {
  final res = await ref.read(ncProvider);
  // .get('https://uselessfacts.jsph.pl/random.json?language=en');
  final Map<String, dynamic> content = jsonDecode(res.toString());
  return Facts.fromJson(content);
});
