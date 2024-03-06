import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IntervalAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const IntervalAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(editViewModelProvider.notifier);

    return AppBar(
      backgroundColor: BrandColor.background,
      title: const Text("復習期間", style: BrandText.titleSM),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () {
              context.pop();
              notifier.updateIntervalDays(ref.watch(intervalViewModelProvider));
            },
            child: Text(
              "完了",
              style: BrandText.titleS.copyWith(color: BrandColor.deleteRed),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
