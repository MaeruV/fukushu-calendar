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

class AddTaskSliverAppBar extends ConsumerWidget with PresentationMixin {
  const AddTaskSliverAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final appLocalizations = AppLocalizations.of(context)!;

    String subject =
        state.hasTask ? appLocalizations.edit : appLocalizations.new_schedule;
    Color color = state.hasChanges ? BrandColor.deleteRed : BrandColor.grey;
    final theme = Theme.of(context);

    return SliverAppBar(
      floating: false,
      elevation: 4.0,
      pinned: true,
      expandedHeight: 50.0,
      centerTitle: true,
      leadingWidth: 100,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      leading: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Center(
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Text(
              appLocalizations.cancel,
              textAlign: TextAlign.start,
              style: BrandText.titleS.copyWith(color: BrandColor.blue),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(subject,
            style: theme.textTheme.titleSmall!
                .copyWith(color: theme.primaryColorLight)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
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
              }
            },
            child: Text(
              appLocalizations.complete,
              textAlign: TextAlign.right,
              style: BrandText.titleS.copyWith(color: color),
            ),
          ),
        ),
      ],
    );
  }
}
