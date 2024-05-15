import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/theme/custom_theme.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/custom_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/widgets/appearance/appearance_labels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppearanceFontPage extends ConsumerWidget {
  const AppearanceFontPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
          title: appLocalizations.text_size, onBack: () => context.pop()),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            AppearanceTableCell(),
            SizedBox(height: 30),
            AppearanceFontSizeContainer(),
          ],
        ),
      ),
    );
  }
}

class AppearanceTableCell extends HookConsumerWidget {
  const AppearanceTableCell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final size = ref.watch(screenViewModelProvider);
    final tableSize = size.mediaHeight * 0.8;
    final width = size.mediaWidth / 7;
    final height = tableSize / 6;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.canvasColor,
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: const AppearanceCell(),
    );
  }
}

class AppearanceCell extends ConsumerWidget {
  const AppearanceCell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textHeight = ref.watch(customThemeProvider).textHeight;
    final appLocalizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          height: textHeight.toDouble(),
          padding: const EdgeInsets.only(top: 3),
          child: Text('28',
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall!.copyWith(color: Colors.red)),
        ),
        Expanded(
          child: AppearanceEventLabels(
            date: DateTime.now().add(const Duration(days: 2)),
            events: [
              CalendarEvent(
                eventName: appLocalizations.temp_english,
                eventDate: DateTime.now().add(const Duration(days: 2)),
                eventBackgroundColor: Colors.amber,
                eventID: 0,
                taskDate: null,
                completedFlag: false,
                rangeType: ReviewRange.page,
                firstRange: 0,
                secoundRange: 0,
              ),
              CalendarEvent(
                eventName: appLocalizations.temp_math,
                eventDate: DateTime.now().add(const Duration(days: 2)),
                eventBackgroundColor: Colors.green,
                eventID: 0,
                taskDate: null,
                completedFlag: false,
                rangeType: ReviewRange.page,
                firstRange: 0,
                secoundRange: 0,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AppearanceFontSizeContainer extends ConsumerWidget {
  const AppearanceFontSizeContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      decoration: BoxDecoration(
          color: theme.highlightColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: const Column(
        children: <Widget>[
          AppearanceFontSizeWidget(),
          Divider(),
          AppearanceThicknessWidget(),
        ],
      ),
    );
  }
}

class AppearanceFontSizeWidget extends HookConsumerWidget {
  const AppearanceFontSizeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final themeNotifier = ref.read(customThemeProvider.notifier);
    final themeState = ref.watch(customThemeProvider);
    final List<int> usStates = [12, 13, 14, 15, 16, 17, 18];

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: PopupMenuButton<int>(
        initialValue: themeState.fontSize.toInt(),
        onSelected: (int value) {
          themeNotifier.updateTheme(
            fontSize: value.toDouble(),
            thickness: null,
            textFamily: null,
            language: null,
          );
        },
        itemBuilder: (BuildContext context) {
          return usStates
              .map(
                (e) => PopupMenuItem<int>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${e.toString()} px',
                        style: theme.textTheme.labelLarge,
                      ),
                      if (themeState.fontSize == e)
                        const Icon(Icons.check, size: 20.0),
                    ],
                  ),
                ),
              )
              .toList();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  appLocalizations.text_size,
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: theme.primaryColorLight),
                ),
              ),
              Row(
                children: [
                  Text(
                    '${themeState.fontSize.toInt().toString()} px',
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.unfold_more_sharp,
                    color: theme.primaryColorLight,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppearanceThicknessWidget extends HookConsumerWidget {
  const AppearanceThicknessWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final List<String> usStates = [
      appLocalizations.thin,
      appLocalizations.thick
    ];
    final themeNotifier = ref.read(customThemeProvider.notifier);
    final themeState = ref.watch(customThemeProvider);
    final formatThickness = themeState.thickness == 'thin'
        ? appLocalizations.thin
        : appLocalizations.thick;

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: PopupMenuButton<String>(
        initialValue: themeState.thickness,
        onSelected: (String value) {
          final formatValue = value == appLocalizations.thin ? 'thin' : 'thick';
          themeNotifier.updateTheme(
            fontSize: null,
            thickness: formatValue,
            textFamily: null,
            language: null,
          );
        },
        itemBuilder: (BuildContext context) {
          return usStates
              .map(
                (e) => PopupMenuItem<String>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e,
                        style: theme.textTheme.labelLarge,
                      ),
                      if (formatThickness == e)
                        const Icon(Icons.check, size: 20.0),
                    ],
                  ),
                ),
              )
              .toList();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  appLocalizations.font_weight,
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: theme.primaryColorLight),
                ),
              ),
              Row(
                children: [
                  Text(
                    formatThickness,
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.unfold_more_sharp,
                    color: theme.primaryColorLight,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
