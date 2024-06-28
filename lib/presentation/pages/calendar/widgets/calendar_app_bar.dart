import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/pages/calendar_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CalendarAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(currentPageProvider);
    final collapse = ref.watch(collapsedProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final todayRowIndex = ref.watch(todayRowIndexProvider);
    final currentPage = ref.watch(currentPageProvider);

    final monthText =
        currentState.visibleDateTime.toformatMonthYear(appLocalizations.date);
    final weekText =
        currentState.visibleDateTime.toYFormat(appLocalizations.date);

    return AppBar(
      elevation: 0,
      centerTitle: false,
      leadingWidth: 300,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: collapse
                ? () {
                    ref.read(collapsedProvider.notifier).state = false;
                    ref.read(topContainerHeightFactorProvider.notifier).state =
                        0.7;
                    ref.read(scrollDirectionProvider.notifier).state =
                        ScrollDirection.none;
                  }
                : null,
            child: collapse
                ? Row(
                    children: [
                      const Icon(Icons.chevron_left_outlined, size: 35),
                      Text(
                        weekText,
                        style: theme.textTheme.titleMedium!
                            .copyWith(color: theme.primaryColorLight),
                      ),
                    ],
                  )
                : Text(
                    monthText,
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: theme.primaryColorLight),
                  ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            final today = DateTime.now().toZeroHour();
            final todayWeek = today.weekday;
            ref.read(scrollDirectionProvider.notifier).state =
                ScrollDirection.none;
            ref.read(todayFlagProvider.notifier).state = false;
            ref.read(todayFlagProvider.notifier).state = true;
            ref.read(tappedCellProvider.notifier).state = {todayWeek: today};
            if (currentPage == 1200) {
              ref.read(sameMonthIndexProvider.notifier).state = todayRowIndex;
            } else {
              ref.read(currentRowIndexProvider.notifier).state = todayRowIndex;
            }
          },
          child: Text(
            appLocalizations.today,
            style: theme.textTheme.titleSmall!.copyWith(color: BrandColor.blue),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
