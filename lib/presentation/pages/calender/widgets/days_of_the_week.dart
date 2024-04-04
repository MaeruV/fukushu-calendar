import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';

const List<String> _DaysOfTheWeek = ['日', '月', '火', '水', '木', '金', '土'];

class DaysOfTheWeek extends StatelessWidget {
  const DaysOfTheWeek({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 25,
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: _DaysOfTheWeek.map((day) => Expanded(
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: BrandText.bodyM.copyWith(
                    color: day == _DaysOfTheWeek.first
                        ? Colors.red // 日曜日を赤色に
                        : day == _DaysOfTheWeek.last
                            ? Colors.blue // 土曜日を青色に
                            : theme.primaryColorLight), // 平日は元の色
              ),
            )).toList(),
      ),
    );
  }
}
