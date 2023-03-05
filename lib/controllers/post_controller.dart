import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/post.dart';

part 'post_controller.g.dart';

@riverpod
class PostController extends _$PostController {
  @override
  FutureOr<List<Post>> build() {
    return [];
  }
}
