import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditFloatingButton extends ConsumerWidget with PresentationMixin {
  const EditFloatingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(temporaryTaskProvider.notifier).state = null;
        context.push('/add_task');
      },
      backgroundColor: BrandColor.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50), //角の丸み
      ),
      child: const Icon(
        Icons.add,
        color: BrandColor.white,
      ),
    );
  }
}
