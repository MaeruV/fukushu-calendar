import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckTaskList extends ConsumerWidget {
  const CheckTaskList(
      {super.key, required this.dates, required this.startdate});

  final List<int> dates;
  final DateTime startdate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
        children: dates
            .map(
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 60,
                      child: Text(
                        '$index日後',
                        style: BrandText.bodyM.copyWith(
                          color: theme.primaryColorLight,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      startdate.add(Duration(days: index)).toJapaneseFormat(),
                      style: BrandText.bodyM.copyWith(
                        color: theme.primaryColorLight,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            )
            .toList());
  }
}
