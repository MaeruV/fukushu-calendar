import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'タイトル',
          style: BrandText.bodyS,
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 80,
          child: TextField(
            style: BrandText.bodyS,
            maxLength: 20,
            controller: controller,
            onChanged: (value) => notifier.setTitleText(value),
            decoration: InputDecoration(
              hintText: 'タイトルを入力してください',
              hintStyle: BrandText.bodyS.copyWith(color: BrandColor.grey),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: BrandColor.grey),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: BrandColor.blue)),
            ),
          ),
        ),
      ],
    );
  }
}
