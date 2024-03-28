import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/interval_cancel_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntervalTileList extends ConsumerWidget {
  const IntervalTileList({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(intervalViewModelProvider);
    final editState = ref.watch(editViewModelProvider);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: SizedBox(
          width: 60,
          child: Text(
            '${state[index]}日後',
            style: theme.textTheme.bodySmall!
                .copyWith(color: theme.primaryColorLight),
            textAlign: TextAlign.center,
          ),
        ),
        title: Text(
          editState.dateTime
              .add(Duration(days: state[index]))
              .toJapaneseFormat(),
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.primaryColorLight),
          textAlign: TextAlign.end,
        ),
        trailing: IntervalCancelBtn(index: index),
      ),
    );
  }
}
