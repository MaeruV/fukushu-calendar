import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalendarAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CalendarAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calenderViewModelProvider);
    final visibleMonth = state.currentIndex.visibleDateTime.month.toString();
    final visibleYear = state.currentIndex.visibleDateTime.year.toString();
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeIn;

    return AppBar(
      centerTitle: false,
      title: Row(
        children: <Widget>[
          Text(
            visibleYear,
            style: BrandText.titleLM,
          ),
          const SizedBox(width: 15),
          Text(
            "$visibleMonth月",
            style: BrandText.titleLM,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: () => state.pageController
                .animateToPage(1200, duration: duration, curve: curve),
            child: SizedBox(
                width: 40,
                child: Text(
                  '今日',
                  style: BrandText.titleS.copyWith(color: BrandColor.blue),
                  textAlign: TextAlign.center,
                )),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
