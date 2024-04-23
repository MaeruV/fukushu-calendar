import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/analysis_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/analysis_bottom_container.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/analysis_select_day.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/analysis_top_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnalysisMainScreen extends HookConsumerWidget {
  const AnalysisMainScreen({super.key});

  String getTextBasedOnDisplayMode(
      DisplayMode mode, AppLocalizations appLocalizations) {
    var timeUnit = "";
    switch (mode) {
      case DisplayMode.week:
        timeUnit = appLocalizations.week;
        break;
      case DisplayMode.month:
        timeUnit = appLocalizations.month;
        break;
      case DisplayMode.year:
        timeUnit = appLocalizations.year;
        break;
    }
    return appLocalizations.localeName == "ja"
        ? "今$timeUnitの${appLocalizations.analysis_title}"
        : "${appLocalizations.analysis_title} this $timeUnit";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(screenViewModelProvider);
    final theme = Theme.of(context);
    final analysisState = ref.watch(analysisViewModelProvider);
    final config = ref.watch(compWeekDataProvider(weeks: analysisState.range));
    final appLocalizations = AppLocalizations.of(context)!;

    final text =
        getTextBasedOnDisplayMode(analysisState.displayMode, appLocalizations);
    return Scaffold(
      appBar: const AnalysisAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(text,
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: theme.primaryColorLight,
                            )),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            config.when(
                              error: (err, _) => Text('Error: $err'),
                              loading: () => const Text(""),
                              data: (data) {
                                final index = data.values.fold(
                                    0,
                                    (previousValue, element) =>
                                        previousValue + element.length);
                                return Text(
                                  index.toString(),
                                  style: theme.textTheme.titleLarge!,
                                );
                              },
                            ),
                            Text(
                              " ${appLocalizations.task}",
                              style: theme.textTheme.labelLarge!,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: theme.primaryColor)),
                      child: const Row(children: [
                        AnalysisSelectDay(mode: DisplayMode.week),
                        AnalysisSelectDay(mode: DisplayMode.month),
                        AnalysisSelectDay(mode: DisplayMode.year),
                      ]),
                    ),
                    Row(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: ref
                              .read(analysisViewModelProvider.notifier)
                              .goToPrevious,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.cardColor,
                          ),
                          child: Icon(
                            Icons.arrow_left,
                            color: theme.primaryColorLight,
                            size: 25,
                          ),
                        ),
                        const SizedBox(width: 5),
                        ElevatedButton(
                          onPressed: ref
                              .read(analysisViewModelProvider.notifier)
                              .goToNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.cardColor,
                          ),
                          child: Icon(
                            Icons.arrow_right,
                            color: theme.primaryColorLight,
                            size: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: size.mediaHeight * 0.3,
                  child: const AnalysisTopContainer(),
                ),
              ],
            ),
          ),
          const Expanded(child: AnalysisBottomContainer())
        ],
      ),
    );
  }
}
