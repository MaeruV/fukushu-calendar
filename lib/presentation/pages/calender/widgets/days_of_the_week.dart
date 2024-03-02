import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';

const List<String> _DaysOfTheWeek = ['日', '月', '火', '水', '木', '金', '土'];

class DaysOfTheWeek extends StatelessWidget {
  const DaysOfTheWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _DaysOfTheWeek.map((day) {
        Color textColor;
        if (day == _DaysOfTheWeek[0]) {
          textColor = Colors.red;
        } else if (day == _DaysOfTheWeek[6]) {
          textColor = Colors.blue;
        } else {
          textColor = Colors.black;
        }

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: BrandText.titleM.copyWith(color: textColor),
            ),
          ),
        );
      }).toList(),
    );
  }
}
