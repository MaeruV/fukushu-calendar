import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskInterval extends ConsumerWidget {
  const AddTaskInterval({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);

    final formattedIntervals =
        '${state.intervalDays.map((interval) => '$interval').join(', ')}日後';

    return GestureDetector(
      onTap: () => context.push('/interval'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '復習間隔',
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
              children: [
                Expanded(
                  child: Text(
                    formattedIntervals,
                    style: BrandText.bodyS,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(
                  Icons.calendar_view_week_rounded,
                  color: BrandColor.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
