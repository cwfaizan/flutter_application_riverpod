import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginStatus { initialize, loading, success, failed }

class LoginController extends StateNotifier<LoginStatus> {
  LoginController() : super(LoginStatus.initialize);

  void toggle(int id) {
    if (id == 1) {
      print('Faizan $id');
      state = LoginStatus.loading;
    }
    if (id == 2) {
      print('Faizan $id');
      state = LoginStatus.success;
    }
    if (id == 3) {
      print('Faizan $id');
      state = LoginStatus.failed;
    }
  }
}

final loginProvider =
    StateNotifierProvider<LoginController, LoginStatus>((ref) {
  return LoginController();
});
