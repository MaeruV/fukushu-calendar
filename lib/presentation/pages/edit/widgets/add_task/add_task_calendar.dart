import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskCalendar extends ConsumerWidget {
  const AddTaskCalendar({super.key});

  Future<DateTime?> showDate(BuildContext context, DateTime dateTime) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = dateTime.subtract(const Duration(days: 30));
    final DateTime lastDate = now.add(const Duration(days: 360));
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    final DateTime? datePicked = await showDatePicker(
      locale: Locale(appLocalizations.localeName),
      context: context,
      initialDate: dateTime,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: theme.primaryColorDark,
              onSurface: theme.primaryColorLight,
            ),
            dialogBackgroundColor: theme.canvasColor,
          ),
          child: child!,
        );
      },
    );
    return datePicked;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final notifier = ref.read(editViewModelProvider.notifier);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () async {
        final datePicked = await showDate(context, state.startTime);
        if (datePicked != null && datePicked != state.startTime) {
          notifier.setDateTime(datePicked);
        }
      },
      child: SizedBox(
        height: 105,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              appLocalizations.start_date,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: theme.primaryColorLight),
            ),
            const SizedBox(height: 5),
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: BrandColor.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    state.startTime.toSimpleFormat(appLocalizations.date),
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: theme.primaryColorLight),
                  ),
                  const Icon(
                    Icons.calendar_month_rounded,
                    color: BrandColor.grey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
