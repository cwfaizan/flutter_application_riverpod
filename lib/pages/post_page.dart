import 'package:flutter/material.dart';
import 'package:flutter_application_riverpod/controllers/post_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pcProvider = ref.watch(postControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: pcProvider.when(
        data: (posts) => ListView(
          children: [
            for (final post in posts) Text(post.title),
          ],
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Text('Error: $err'),
      ),
    );
  }
}
