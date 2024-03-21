import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalendarListTile extends HookConsumerWidget with PresentationMixin {
  const CalendarListTile({super.key, required this.events});

  final List<CalendarEvent> events;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: events
          .map(
            (event) => switch (
                ref.watch(tempTaskDateProvider(taskDate: event.taskDate))) {
              AsyncError(:final error) => Text('Error: $error'),
              AsyncData(:final value) => value == null
                  ? Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: event.eventBackgroundColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          title: Text(
                            event.eventName,
                            style: BrandText.bodyM,
                          ),
                          subtitle: Text(
                            "開始日",
                            style: BrandText.bodyS
                                .copyWith(color: BrandColor.grey),
                          ),
                        ),
                      ),
                    )
                  : Card(
                      color: BrandColor.white,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)),
                                color: event.eventBackgroundColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      event.eventName,
                                      style: BrandText.bodyM,
                                    ),
                                    Text(
                                      "${value.daysInterval}日目",
                                      style: BrandText.bodyS
                                          .copyWith(color: BrandColor.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Checkbox(
                              value: value.checkFlag,
                              onChanged: (flag) {
                                execute(context, action: () async {
                                  if (flag != null) {
                                    ref.read(taskUsecaseProvider).saveTaskDate(
                                        taskDate: value, flag: flag);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
              _ => const CircularProgressIndicator()
            },
          )
          .toList(),
    );
  }
}
