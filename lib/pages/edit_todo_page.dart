import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_riverpod/models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/checkbox_controller.dart';
import '../controllers/todo_controller.dart';

class EditTodoPage extends ConsumerWidget {
  EditTodoPage({super.key});
  final descriptionController = TextEditingController();
  final _todoFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('message Widget build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _todoFormKey,
            child: Column(
              children: [
                const Text('Add Your Task Here'),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type Description',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Description required';
                    } else if (value.trim().isEmpty) {
                      return 'Description required';
                    }
                    return null;
                  },
                ),
                Consumer(builder: (context, cRef, child) {
                  log('message Consumer(builder');
                  final cbcProvider = cRef.watch(checkboxControllerProvider);
                  return CheckboxListTile(
                    title: const Text('Task Completed'),
                    onChanged: (bool? isChecked) {
                      cRef.read(checkboxControllerProvider.notifier).toggle();
                    },
                    value: cbcProvider,
                  );
                }),
                ElevatedButton(
                  onPressed: () {
                    bool isValid = _todoFormKey.currentState!.validate();
                    FocusScope.of(context).unfocus();
                    if (!isValid) {
                      return;
                    }
                    _todoFormKey.currentState!.save();
                    ref.read(todoControllerProvider.notifier).addTodo(
                          Todo(
                            id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            description: descriptionController.text.trim(),
                            completed: ref.watch(checkboxControllerProvider),
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
