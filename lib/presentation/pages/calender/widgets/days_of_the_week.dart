import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';

const List<String> _DaysOfTheWeek = ['日', '月', '火', '水', '木', '金', '土'];

class DaysOfTheWeek extends StatelessWidget {
  const DaysOfTheWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _DaysOfTheWeek.map((day) => Expanded(
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: BrandText.bodyM.copyWith(
                color: day == _DaysOfTheWeek.first || day == _DaysOfTheWeek.last
                    ? BrandColor.grey
                    : Colors.black,
              ),
            ),
          )).toList(),
    );
  }
}
