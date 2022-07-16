import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider<String>((ref) {
  return 'Hello Faizan';
});

final yearProvider = Provider<int>((ref) {
  return 2022;
});

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});
