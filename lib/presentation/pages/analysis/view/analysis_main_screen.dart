import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/analysis_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/analysis_bottom_container.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/analysis_top_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnalysisMainScreen extends HookConsumerWidget {
  const AnalysisMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(screenViewModelProvider);
    final theme = Theme.of(context);
    final weeks = ref.watch(analysisViewModelProvider);
    final config = ref.watch(compWeekDataProvider(weeks: weeks.oneWeek));
    final appLocalizations = AppLocalizations.of(context)!;

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
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(appLocalizations.analysis_title,
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: theme.primaryColorLight,
                      )),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        RichText(
                            text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            config.when(
                              error: (err, _) => TextSpan(text: 'Error: $err'),
                              loading: () => const TextSpan(text: ""),
                              data: (data) {
                                final index = data.values.fold(
                                    0,
                                    (previousValue, element) =>
                                        previousValue + element.length);
                                return TextSpan(
                                  text: index.toString(),
                                  style: theme.textTheme.titleLarge!,
                                );
                              },
                            ),
                            TextSpan(
                              text: " ${appLocalizations.task}",
                              style: theme.textTheme.labelLarge!,
                            )
                          ],
                        )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: ref
                              .read(analysisViewModelProvider.notifier)
                              .goToPreviousWeek,
                          child: Icon(
                            Icons.arrow_left,
                            color: theme.primaryColorLight,
                            size: 25,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: ref
                              .read(analysisViewModelProvider.notifier)
                              .goToNextWeek,
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
              ],
            ),
          ),
          SizedBox(
            height: size.mediaHeight * 0.3,
            child: const Padding(
                padding: EdgeInsets.all(16), child: AnalysisTopContainer()),
          ),
          const Expanded(child: AnalysisBottomContainer())
        ],
      ),
    );
  }
}
