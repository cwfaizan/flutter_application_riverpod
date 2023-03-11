import 'package:flutter_application_riverpod/networks/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/post.dart';

part 'post_controller.g.dart';

@riverpod
class PostController extends _$PostController {
  Future<List<Post>> _fetchPost() async {
    final res = await ref.watch(dioProvider).get('/posts');
    // jsonDecode(data)
    return List<Post>.from(res.data.map((post) => Post.fromJson(post)));
  }

  @override
  FutureOr<List<Post>> build() {
    return _fetchPost();
  }
}
