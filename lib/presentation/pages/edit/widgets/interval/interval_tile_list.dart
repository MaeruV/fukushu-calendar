import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/interval_cancel_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntervalTileList extends ConsumerWidget {
  const IntervalTileList({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(intervalViewModelProvider);
    final editState = ref.watch(editViewModelProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: SizedBox(
          width: 100,
          child: Text(
            '${state[index]} ${appLocalizations.days_after}',
            style: theme.textTheme.bodySmall!
                .copyWith(color: theme.primaryColorLight),
            textAlign: TextAlign.center,
          ),
        ),
        title: Text(
          editState.startTime
              .add(Duration(days: state[index]))
              .toSimpleFormat(appLocalizations.date),
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.primaryColorLight),
          textAlign: TextAlign.end,
        ),
        trailing: IntervalCancelBtn(index: index),
      ),
    );
  }
}
