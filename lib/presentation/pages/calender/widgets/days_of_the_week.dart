import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DaysOfTheWeek extends StatelessWidget {
  const DaysOfTheWeek({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    final List<String> daysOfTheWeek = [
      appLocalizations.sunday,
      appLocalizations.monday,
      appLocalizations.tuesday,
      appLocalizations.wednesday,
      appLocalizations.thursday,
      appLocalizations.friday,
      appLocalizations.saturday,
    ];

    return Container(
      height: 25,
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: daysOfTheWeek
            .map((day) => Expanded(
                  child: Text(
                    day,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelSmall!.copyWith(
                        color: day == daysOfTheWeek.first
                            ? Colors.red // 日曜日を赤色に
                            : day == daysOfTheWeek.last
                                ? Colors.blue // 土曜日を青色に
                                : theme.primaryColorLight), // 平日は元の色
                  ),
                ))
            .toList(),
      ),
    );
  }
}
