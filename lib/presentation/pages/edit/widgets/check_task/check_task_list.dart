import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
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
    return Column(
        children: dates
            .map(
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 60,
                        child: Text(
                          '$index日後',
                          style: BrandText.bodyM,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        startdate.add(Duration(days: index)).toJapaneseFormat(),
                        style: BrandText.bodyM,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList());
  }
}
