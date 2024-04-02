import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/others/others_notification_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskNotification extends ConsumerWidget {
  const AddTaskNotification({super.key});

  Future<TimeOfDay?> showDate(BuildContext context, DateTime time) async {
    final theme = Theme.of(context);
    TimeOfDay timeOfDay = TimeOfDay(hour: time.hour, minute: time.minute);
    final TimeOfDay? datePicked = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: Theme.of(context).copyWith(
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              timePickerTheme: theme.timePickerTheme,
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue),
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue),
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );
    return datePicked;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final notifier = ref.read(editViewModelProvider.notifier);
    final theme = Theme.of(context);
    final now = DateTime.now().toZeroHour();

    return GestureDetector(
      onTap: () async {
        final now = DateTime.now().toZeroHour();
        final datePicked = await showDate(context, state.time ?? now);
        if (datePicked != null) {
          DateTime time = DateTime(
              now.year, now.month, now.day, datePicked.hour, datePicked.minute);
          if (time != state.time) {
            notifier.setTime(time);
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '通知時間',
                style: theme.textTheme.bodySmall!
                    .copyWith(color: theme.primaryColorLight),
              ),
              Switch(
                value: state.flagNotification,
                onChanged: (flag) async {
                  if (flag) {
                    await ref
                        .read(othersNotifierModelProvider.notifier)
                        .permission();
                  }
                  ref
                      .read(editViewModelProvider.notifier)
                      .setNotificationFlag(flag);
                },
              )
            ],
          ),
          const SizedBox(height: 5),
          Visibility(
            visible: ref.watch(editViewModelProvider).flagNotification,
            child: Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: BrandColor.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    state.time?.toHourMinute() ?? now.toHourMinute(),
                    style: BrandText.bodyS,
                  ),
                  const Icon(
                    Icons.timelapse,
                    color: BrandColor.grey,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
