import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskCalendar extends ConsumerWidget {
  const AddTaskCalendar({super.key});

  Future<DateTime?> showDate(BuildContext context, DateTime dateTime) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = dateTime.subtract(const Duration(days: 30));
    final DateTime lastDate = now.add(const Duration(days: 360));

    final DateTime? datePicked = await showDatePicker(
      locale: const Locale("ja"),
      context: context,
      initialDate: dateTime,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    return datePicked;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final notifier = ref.read(editViewModelProvider.notifier);
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () async {
        final datePicked = await showDate(context, state.dateTime);
        if (datePicked != null && datePicked != state.dateTime) {
          notifier.setDateTime(datePicked);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '開始日',
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
                  state.dateTime.toJapaneseFormat(),
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
    );
  }
}
