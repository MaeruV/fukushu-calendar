import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskNotification extends ConsumerWidget {
  const AddTaskNotification({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final notifier = ref.read(editViewModelProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '通知',
          style: BrandText.bodyM.copyWith(color: BrandColor.grey),
        ),
        Switch(
          value: state.notification,
          onChanged: notifier.toggleNotification,
        ),
      ],
    );
  }
}
