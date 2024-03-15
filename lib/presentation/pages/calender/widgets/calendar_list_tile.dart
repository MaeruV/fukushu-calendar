import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
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
                ref.watch(tempTaskDateProvider(dateId: event.taskDate.id))) {
              AsyncError(:final error) => Text('Error: $error'),
              AsyncData(:final value) => value == null
                  ? const SizedBox.shrink()
                  : Card(
                      color: BrandColor.white,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: event.eventBackgroundColor,
                        ),
                        title: Text(event.eventName),
                        trailing: Checkbox(
                          value: value.checkFlag,
                          onChanged: (flag) {
                            execute(context, action: () async {
                              if (flag != null) {
                                ref
                                    .read(taskUsecaseProvider)
                                    .saveTaskDate(taskDate: value, flag: flag);
                              }
                            });
                          },
                        ),
                        subtitle: Text("${value.daysInterval}日目"),
                        onTap: () {},
                      ),
                    ),
              _ => const CircularProgressIndicator()
            },
          )
          .toList(),
    );
  }
}
