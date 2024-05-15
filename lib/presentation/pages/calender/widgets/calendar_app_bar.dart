import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CalendarAppBar({super.key, required this.value, required this.onTap});

  final Map<DateTime, List<CalendarEvent>> value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final currentState = ref.watch(currentPageProvider);

    return AppBar(
      elevation: 0,
      centerTitle: false,
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            currentState.visibleDateTime
                .toformatMonthYear(appLocalizations.date),
            style: theme.textTheme.titleLarge!.copyWith(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onTap,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                appLocalizations.today,
                style: theme.textTheme.titleSmall!
                    .copyWith(color: BrandColor.blue),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
