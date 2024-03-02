import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/interval_cancel_btn.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntervalTileList extends ConsumerWidget {
  const IntervalTileList({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(intervalViewModelProvider);
    final time = DateTime.now();

    return Card(
      margin: const EdgeInsets.all(5),
      child: ListTile(
        leading: SizedBox(
            width: 65,
            child: Text('${state[index]}日後', style: BrandText.bodyM)),
        title: Text(
          time.add(Duration(days: state[index])).toJapaneseFormat(),
          style: BrandText.bodyM,
        ),
        trailing: IntervalCancelBtn(index: index),
      ),
    );
  }
}
