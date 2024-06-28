import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarWeekdayDisplay extends ConsumerWidget {
  const CalendarWeekdayDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        children: daysOfTheWeek.map((day) {
          Color textColor = theme.primaryColorLight;
          if (day == appLocalizations.sunday) {
            textColor = Colors.red;
          } else if (day == appLocalizations.saturday) {
            textColor = Colors.blue;
          }

          return Expanded(
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor),
            ),
          );
        }).toList(),
      ),
    );
  }
}
