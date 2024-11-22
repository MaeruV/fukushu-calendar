import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dataModeProvider = StateProvider<DataMode>((ref) => DataMode.tasks);

class AnalysisSelectData extends ConsumerWidget {
  const AnalysisSelectData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final modeState = ref.watch(dataModeProvider);
    const modeList = [DataMode.tasks, DataMode.events];

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: PopupMenuButton<DataMode>(
        initialValue: modeState,
        onSelected: (DataMode mode) =>
            ref.read(dataModeProvider.notifier).state = mode,
        itemBuilder: (BuildContext context) {
          return modeList.map((mode) {
            final data = mode == DataMode.tasks
                ? appLocalizations.task
                : appLocalizations.event;
            return PopupMenuItem<DataMode>(
              value: mode,
              child: Text(data),
            );
          }).toList();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Text(
                modeState == DataMode.tasks
                    ? appLocalizations.task
                    : appLocalizations.event,
                style: theme.textTheme.labelLarge!
                    .copyWith(color: theme.primaryColorLight),
              ),
              Icon(Icons.keyboard_arrow_down, color: theme.primaryColorLight),
            ],
          ),
        ),
      ),
    );
  }
}
