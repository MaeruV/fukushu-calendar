import 'dart:math';

import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/bar%20graph/bar_data.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/bar%20graph/individual_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyBarGraph extends HookConsumerWidget {
  const MyBarGraph({
    super.key,
    required this.summary,
    required this.mode,
  });
  final List<double> summary;
  final DisplayMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(analysisViewModelProvider);

    BarData myBarData = BarData(amounts: summary);
    List<IndividualBar> barData = myBarData.getBarData();

    double width = 25;
    switch (mode) {
      case DisplayMode.week:
        width = 25;
      case DisplayMode.month:
        width = 25;
      default:
        width = 15;
    }

    return BarChart(BarChartData(
        maxY: summary.reduce(max) + 4,
        minY: 0,
        gridData: const FlGridData(drawVerticalLine: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
            show: true,
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(
              reservedSize: 30,
              showTitles: true,
              getTitlesWidget: (value, meta) =>
                  GetLeftTitles(value: value, meta: meta),
            )),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              reservedSize: 50,
              showTitles: true,
              getTitlesWidget: (value, meta) =>
                  GetBottomTitles(value: value, meta: meta, mode: mode),
            ))),
        barGroups: barData
            .asMap()
            .map((index, data) {
              final isTouched = index == state.indexTapped;
              return MapEntry(
                  index,
                  BarChartGroupData(x: data.x, barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: isTouched
                          ? theme.focusColor
                          : theme.primaryColorLight,
                      width: width,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(0),
                        top: Radius.circular(4),
                      ),
                    )
                  ]));
            })
            .values
            .toList(),
        barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: theme.primaryColorLight,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                    rod.toY.round().toString(),
                    theme.textTheme.bodySmall!
                        .copyWith(color: theme.primaryColorDark));
              },
            ),
            touchCallback: (FlTouchEvent event, response) {
              if (event.isInterestedForInteractions &&
                  response != null &&
                  response.spot != null) {
                ref
                    .read(analysisViewModelProvider.notifier)
                    .barIndexTapped(response.spot!.touchedBarGroupIndex);
              }
            })));
  }
}

class GetLeftTitles extends ConsumerWidget {
  const GetLeftTitles({super.key, required this.value, required this.meta});

  final double value;
  final TitleMeta meta;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final style =
        theme.textTheme.bodySmall!.copyWith(color: theme.primaryColorLight);

    return Text(
      value.toInt().toString(),
      style: style,
      textAlign: TextAlign.center,
    );
  }
}

class GetBottomTitles extends ConsumerWidget {
  const GetBottomTitles(
      {super.key, required this.value, required this.meta, required this.mode});

  final double value;
  final TitleMeta meta;
  final DisplayMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final analysisState = ref.watch(analysisViewModelProvider);

    final style =
        theme.textTheme.bodySmall!.copyWith(color: theme.primaryColorLight);
    Widget widget;

    switch (mode) {
      case DisplayMode.month:
        switch (appLocalizations.localeName) {
          case "en":
            widget = Text("Week ${value.toInt() + 1}", style: style);
          default:
            widget = Text("第${value.toInt() + 1}週", style: style);
        }
        break;
      case DisplayMode.year:
        // 年モードの場合、月のラベルを表示
        List<String> months = [
          appLocalizations.january,
          appLocalizations.february,
          appLocalizations.march,
          appLocalizations.april,
          appLocalizations.may,
          appLocalizations.june,
          appLocalizations.july,
          appLocalizations.august,
          appLocalizations.september,
          appLocalizations.october,
          appLocalizations.november,
          appLocalizations.december,
        ];
        switch (appLocalizations.localeName) {
          case "en":
            widget = Text(months[value.toInt()],
                style: style.copyWith(fontSize: 13));
          default:
            widget = Text(months[value.toInt()], style: style);
        }
        break;
      default:
        // 週モードの場合、日付と曜日のラベルを表示
        final DateTime firstDayOfWeek = analysisState.range[0]
            .subtract(Duration(days: analysisState.range[0].weekday - 1));
        final DateTime targetDate =
            firstDayOfWeek.add(Duration(days: value.toInt()));
        final int weekDayIndex = targetDate.weekday - 1;
        final List<String> weekDays = [
          appLocalizations.monday,
          appLocalizations.tuesday,
          appLocalizations.wednesday,
          appLocalizations.thursday,
          appLocalizations.friday,
          appLocalizations.saturday,
          appLocalizations.sunday,
        ];
        widget = Column(
          children: <Widget>[
            Text(targetDate.toMDFormat(), style: style),
            Text(weekDays[weekDayIndex],
                style:
                    BrandText.bodySS.copyWith(color: theme.primaryColorLight)),
          ],
        );
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: widget,
    );
  }
}
