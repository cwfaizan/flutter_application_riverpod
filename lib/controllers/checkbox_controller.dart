import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkbox_controller.g.dart';

@riverpod
class CheckboxController extends _$CheckboxController {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
