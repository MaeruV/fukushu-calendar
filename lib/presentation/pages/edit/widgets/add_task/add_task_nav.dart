import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/material_history/material_history_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskNav extends ConsumerWidget with PresentationMixin {
  const AddTaskNav({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final appLocalizations = AppLocalizations.of(context)!;

    String subject =
        state.hasTask ? appLocalizations.edit : appLocalizations.new_schedule;
    Color color = state.hasChanges ? BrandColor.deleteRed : BrandColor.grey;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Text(
                appLocalizations.cancel,
                style: BrandText.titleS.copyWith(color: BrandColor.blue),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(subject,
                style: theme.textTheme.titleSmall!
                    .copyWith(color: theme.primaryColorLight)),
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
                            rangeType: state.reviewRange,
                            firstRange: state.firstRange ?? 0,
                            secoundRange: state.secoundRange,
                            title: state.title,
                            memo: state.memo,
                            dateTime: state.startTime,
                            intervalDays: state.intervalDays,
                            pallete: state.pallete,
                            time: state.time,
                            flagNotification: state.flagNotification,
                            eventCompDay: null,
                            appLocalizations: appLocalizations,
                          );
                      await ref
                          .read(materialHistoryViewModelProvider.notifier)
                          .saveMaterialHistory(state.title);
                    },
                  );
                  context.pop();
                } else {
                  print('hasChangesがfalse');
                }
              },
              child: Text(
                appLocalizations.complete,
                style: BrandText.titleS.copyWith(color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
