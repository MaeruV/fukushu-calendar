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
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Text(
              '復習間隔',
              style: BrandText.bodyM.copyWith(color: BrandColor.grey),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      formattedIntervals,
                      style: BrandText.bodyM.copyWith(color: BrandColor.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.chevron_right_outlined,
                    color: BrandColor.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
