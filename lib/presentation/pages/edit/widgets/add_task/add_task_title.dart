import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskTitle extends HookConsumerWidget {
  const AddTaskTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider.notifier);

    return Row(
      children: <Widget>[
        const Icon(
          Icons.book,
          color: BrandColor.grey,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: state.textController,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "教材",
              hintText: "タイトル",
            ),
          ),
        ),
      ],
    );
  }
}
