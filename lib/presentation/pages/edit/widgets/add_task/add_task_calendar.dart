import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskCalendar extends ConsumerWidget {
  const AddTaskCalendar({super.key});

  Future<DateTime?> showDate(BuildContext context, DateTime dateTime) async {
    final DateTime? datePicked = await showDatePicker(
      locale: const Locale("ja"),
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime.now().add(
        const Duration(days: 30),
      ),
    );
    return datePicked;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final notifier = ref.read(editViewModelProvider.notifier);

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
          const Text(
            '開始日',
            style: BrandText.bodyM,
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
                  style: BrandText.bodyS,
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
