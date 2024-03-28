import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/modal_manager.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditAddTaskButton extends ConsumerWidget {
  const EditAddTaskButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ModalManager modal = ModalManager();
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        ref.read(temporaryTaskProvider.notifier).state = null;
        modal.customShowModalSheet(context);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: theme.focusColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Icon(
          Icons.add,
          color: BrandColor.white,
        ),
      ),
    );
  }
}
