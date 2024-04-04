import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckTaskList extends ConsumerWidget {
  const CheckTaskList(
      {super.key, required this.dates, required this.startdate});

  final List<TaskDate> dates;
  final DateTime startdate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
        children: dates
            .map(
              (dateData) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 60,
                      child: Text(
                        '${dateData.daysInterval}日後',
                        style: BrandText.bodyM.copyWith(
                            color: theme.primaryColorLight,
                            decoration: dateData.checkFlag
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          startdate
                              .add(Duration(days: dateData.daysInterval))
                              .toJapaneseFormat(),
                          style: BrandText.bodyM.copyWith(
                              color: theme.primaryColorLight,
                              decoration: dateData.checkFlag
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 60,
                          child: dateData.checkFlag
                              ? Text('完了済み',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    color: BrandColor.deleteRed,
                                  ))
                              : Text('未完了',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    color: BrandColor.blue,
                                  )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
            .toList());
  }
}
