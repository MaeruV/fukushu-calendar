import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskAppBar extends HookConsumerWidget
    with PresentationMixin
    implements PreferredSizeWidget {
  const AddTaskAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    String subject = state.hasTask ? '編集' : '新規';
    String succesMessage = state.hasTask ? '更新しました' : '追加しました';
    Color color = state.hasChanges ? BrandColor.deleteRed : BrandColor.grey;

    return AppBar(
      backgroundColor: BrandColor.background,
      title: Text(subject, style: BrandText.titleSM),
      leadingWidth: 100,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Center(
          child: Text(
            'キャンセル',
            style: BrandText.titleS.copyWith(color: BrandColor.blue),
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
                  await ref.read(taskUsecaseProvider).saveTaskEvent(
                        title: state.title,
                        memo: state.memo,
                        dateTime: state.dateTime,
                        intervalDays: state.intervalDays,
                      );
                },
                successMessage: succesMessage,
              );
              context.pop();
            },
            child: Text(
              "完了",
              style: BrandText.titleS.copyWith(color: color),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
