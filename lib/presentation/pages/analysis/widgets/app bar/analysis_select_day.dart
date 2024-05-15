import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnalysisSelectDay extends ConsumerWidget {
  const AnalysisSelectDay({super.key, required this.mode});

  final DisplayMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final state = ref.watch(analysisViewModelProvider);

    String text = "";

    switch (mode) {
      case DisplayMode.week:
        text = appLocalizations.week;
        break;
      case DisplayMode.year:
        text = appLocalizations.year;
        break;
      default:
    }

    Color textColor = state.displayMode == mode
        ? theme.primaryColorDark
        : theme.primaryColorLight;

    Color backgroundColor = state.displayMode == mode
        ? theme.primaryColorLight
        : Colors.transparent;

    final style = theme.textTheme.bodySmall!.copyWith(color: textColor);

    return GestureDetector(
      onTap: () =>
          ref.read(analysisViewModelProvider.notifier).setDisplayMode(mode),
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
        ),
        child: Center(
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}
