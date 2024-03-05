import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddTaskAppBar extends ConsumerWidget
    with PresentationMixin
    implements PreferredSizeWidget {
  const AddTaskAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    String subject = state.hasTask ? '編集' : '新規';

    return AppBar(
      backgroundColor: BrandColor.background,
      title: Text(subject, style: BrandText.titleSM),
      leadingWidth: 100,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Center(
          child: Text(
            'キャンセル',
            style: BrandText.titleS.copyWith(
                color: BrandColor
                    .blue), // Use the same style as the title for uniformity
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () {
              execute(
                context,
                action: () async {
                  state.hasTask
                      ? await ref.read(taskUsecaseProvider).updateTaskEvent()
                      : await ref.read(taskUsecaseProvider).addTaskEvent();
                },
                successMessage: state.hasTask ? '更新しました' : '追加しました',
              );
              context.pop();
            },
            child: Text(
              "完了",
              style: BrandText.titleS.copyWith(color: BrandColor.deleteRed),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
