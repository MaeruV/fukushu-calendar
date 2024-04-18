import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompListView extends ConsumerWidget {
  const CompListView(
      {super.key, required this.dateTime, required this.taskDates});

  final DateTime dateTime;
  final List<TaskDate> taskDates;

  Color todayColor(ThemeData theme) {
    final now = DateTime.now();
    final taskDate = dateTime;

    if (taskDate.year == now.year &&
        taskDate.month == now.month &&
        taskDate.day == now.day) {
      return BrandColor.deleteRed;
    } else {
      return theme.primaryColorLight;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(
            dateTime.toRelativeJapaneseFormat(appLocalizations.date),
            style:
                theme.textTheme.titleMedium!.copyWith(color: todayColor(theme)),
          ),
        ),
        CompListWidget(taskDates: taskDates, dateTime: dateTime),
      ],
    );
  }
}

class CompListWidget extends ConsumerWidget with PresentationMixin {
  const CompListWidget(
      {super.key, required this.taskDates, required this.dateTime});

  final List<TaskDate> taskDates;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Column(
      children: taskDates.map((taskDate) {
        final task = taskDate.task.value;
        return task == null
            ? const SizedBox.shrink()
            : Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: IntrinsicHeight(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          decoration: BoxDecoration(
                              color: Color(task.pallete),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 15.0, 5.0, 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.title,
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(color: theme.primaryColorLight),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  taskDate.daysInterval
                                      .toformatDay(appLocalizations.date),
                                  style: BrandText.bodyS
                                      .copyWith(color: BrandColor.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Checkbox(
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return theme.focusColor;
                            }
                            return theme.colorScheme.secondary;
                          }),
                          checkColor: Colors.white,
                          value: taskDate.checkFlag,
                          onChanged: (flag) {
                            execute(context, action: () async {
                              if (flag != null) {
                                ref.read(taskUsecaseProvider).saveTaskDate(
                                      taskDate: taskDate,
                                      flag: flag,
                                      time: dateTime,
                                      weeks: ref
                                          .watch(analysisViewModelProvider)
                                          .range,
                                    );
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }).toList(),
    );
  }
}
