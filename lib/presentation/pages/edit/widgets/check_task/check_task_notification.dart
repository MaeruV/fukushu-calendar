import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckTaskNotification extends ConsumerWidget {
  const CheckTaskNotification({super.key, required this.notificationTasks});

  final List<NotificationTask> notificationTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    DateTime? time;
    if (notificationTasks.isNotEmpty) {
      time = notificationTasks.first.dateTime;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('通知時間',
            style: BrandText.bodyM.copyWith(
              color: theme.primaryColorLight,
            )),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(time != null ? time.toHourMinute() : 'オフ',
              style: BrandText.bodyM.copyWith(
                color: theme.primaryColorLight,
              )),
        ),
      ],
    );
  }
}
