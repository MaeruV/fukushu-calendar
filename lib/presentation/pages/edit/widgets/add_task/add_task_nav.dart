import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskNav extends ConsumerWidget with PresentationMixin {
  const AddTaskNav({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    String subject = state.hasTask ? '編集' : '新規';
    String succesMessage = state.hasTask ? '更新しました' : '追加しました';
    Color color = state.hasChanges ? BrandColor.deleteRed : BrandColor.grey;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Text(
                'キャンセル',
                style: BrandText.titleS.copyWith(color: BrandColor.blue),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(subject, style: BrandText.titleSM),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                if (state.hasChanges) {
                  execute(
                    context,
                    action: () async {
                      await ref.read(taskUsecaseProvider).saveTaskEvent(
                            title: state.title,
                            memo: state.memo,
                            dateTime: state.dateTime,
                            intervalDays: state.intervalDays,
                            pallete: state.pallete,
                          );
                    },
                    successMessage: succesMessage,
                  );
                  context.pop();
                }
              },
              child: Text(
                "完了",
                style: BrandText.titleS.copyWith(color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
