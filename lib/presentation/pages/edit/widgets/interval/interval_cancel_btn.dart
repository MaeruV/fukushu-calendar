import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntervalCancelBtn extends ConsumerWidget {
  const IntervalCancelBtn({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(intervalViewModelProvider.notifier);
    return GestureDetector(
      onTap: () => notifier.deleteNumber(index),
      child: const Icon(
        Icons.cancel_outlined,
        color: BrandColor.grey,
      ),
    );
  }
}
