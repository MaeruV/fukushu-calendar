import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskTitle extends HookConsumerWidget {
  const AddTaskTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(editViewModelProvider.notifier);
    final state = ref.watch(editViewModelProvider);

    final controller = useTextEditingController(text: state.title);

    return Row(
      children: <Widget>[
        const Icon(
          Icons.book,
          color: BrandColor.grey,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            maxLength: 20,
            controller: controller,
            onChanged: (value) => notifier.setTitleText(value),
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "タイトル",
            ),
          ),
        ),
      ],
    );
  }
}
