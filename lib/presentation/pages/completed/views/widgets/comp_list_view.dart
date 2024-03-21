import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompListView extends ConsumerWidget {
  const CompListView(
      {super.key, required this.dateTime, required this.taskDates});

  final DateTime dateTime;
  final List<TaskDate> taskDates;

  Color todayColor() {
    final now = DateTime.now();
    final taskDate = dateTime;

    if (taskDate.year == now.year &&
        taskDate.month == now.month &&
        taskDate.day == now.day) {
      return BrandColor.deleteRed;
    } else {
      return BrandColor.grey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dateTime.toRelativeJapaneseFormat(),
            style: BrandText.titleM.copyWith(color: todayColor()),
          ),
        ),
        const SizedBox(height: 5),
        CompListWidget(taskDates: taskDates),
      ],
    );
  }
}

class CompListWidget extends ConsumerWidget with PresentationMixin {
  const CompListWidget({super.key, required this.taskDates});

  final List<TaskDate> taskDates;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: taskDates.map((taskDate) {
        final task = taskDate.task.value;
        return task == null
            ? const SizedBox.shrink()
            : Card(
                child: IntrinsicHeight(
                  child: Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
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
                                  style: BrandText.bodyLM,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${taskDate.daysInterval}日目',
                                  style: BrandText.bodyS
                                      .copyWith(color: BrandColor.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Checkbox(
                          value: taskDate.checkFlag,
                          onChanged: (flag) {
                            execute(context, action: () async {
                              if (flag != null) {
                                ref.read(taskUsecaseProvider).saveTaskDate(
                                    taskDate: taskDate, flag: flag);
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
