import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskMemo extends HookConsumerWidget {
  const AddTaskMemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(editViewModelProvider.notifier);
    final state = ref.watch(editViewModelProvider);

    final controller = useTextEditingController(text: state.memo);

    return TextField(
      controller: controller,
      onChanged: (value) => notifier.setMemoText(value),
      maxLines: 5,
      maxLength: 100,
      decoration: const InputDecoration(
        labelText: 'メモ',
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(),
      ),
      // keyboardType: TextInputType.multiline,
    );
  }
}
