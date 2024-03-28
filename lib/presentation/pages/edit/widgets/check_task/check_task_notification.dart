import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckTaskNotification extends ConsumerWidget {
  const CheckTaskNotification({super.key, required this.time});

  final DateTime time;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('通知時間',
              style: BrandText.bodyM.copyWith(
                color: theme.primaryColorLight,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(time.toHourMinute(),
                style: BrandText.bodyM.copyWith(
                  color: theme.primaryColorLight,
                )),
          ),
        ],
      ),
    );
  }
}
