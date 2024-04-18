import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/bar%20graph/bar_data.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyBarGraph extends HookConsumerWidget {
  const MyBarGraph({super.key, required this.weeklySummary});
  final List<double> weeklySummary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(analysisViewModelProvider);

    BarData myBarData = BarData(
      monAmount: weeklySummary[0],
      tueAmount: weeklySummary[1],
      wedAmount: weeklySummary[2],
      thurAmount: weeklySummary[3],
      friAmount: weeklySummary[4],
      satAmount: weeklySummary[5],
      sunAmount: weeklySummary[6],
    );
    myBarData.initializeBarData();

    return BarChart(BarChartData(
        maxY: 10,
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
              reservedSize: 45,
              showTitles: true,
              getTitlesWidget: (value, meta) =>
                  GetBottomTitles(value: value, meta: meta),
            ))),
        barGroups: myBarData.barData
            .asMap()
            .map((index, data) {
              final isTouched = index == state.indexTapped;
              return MapEntry(
                  index,
                  BarChartGroupData(x: data.x, barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: isTouched ? Colors.red : Colors.grey[800],
                      width: 25,
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
              tooltipBgColor: Colors.blueGrey,
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

    final style = theme.textTheme.bodySmall!.copyWith(color: BrandColor.grey);

    return Text(
      value.toInt().toString(),
      style: style,
      textAlign: TextAlign.center,
    );
  }
}

class GetBottomTitles extends ConsumerWidget {
  const GetBottomTitles({super.key, required this.value, required this.meta});

  final double value;
  final TitleMeta meta;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final analysis = ref.watch(analysisViewModelProvider);

    List<DateTime> weekDates = [];
    for (int i = 0; i < 7; i++) {
      weekDates.add(analysis.oneWeek[0].add(Duration(days: i)));
    }

    final dayStyle =
        theme.textTheme.bodySmall!.copyWith(color: BrandColor.grey);
    final weekStyle = BrandText.bodySS.copyWith(color: BrandColor.grey);

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Column(
          children: [
            Text(weekDates[0].toMDFormat(), style: dayStyle),
            Text(appLocalizations.monday, style: weekStyle),
          ],
        );
        break;
      case 1:
        text = Column(
          children: [
            Text(weekDates[1].toMDFormat(), style: dayStyle),
            Text(appLocalizations.tuesday, style: weekStyle),
          ],
        );
      case 2:
        text = Column(
          children: [
            Text(weekDates[2].toMDFormat(), style: dayStyle),
            Text(appLocalizations.wednesday, style: weekStyle),
          ],
        );
        break;
      case 3:
        text = Column(
          children: [
            Text(weekDates[3].toMDFormat(), style: dayStyle),
            Text(appLocalizations.thursday, style: weekStyle),
          ],
        );
        break;
      case 4:
        text = Column(
          children: [
            Text(weekDates[4].toMDFormat(), style: dayStyle),
            Text(appLocalizations.friday, style: weekStyle),
          ],
        );
        break;
      case 5:
        text = Column(
          children: [
            Text(weekDates[5].toMDFormat(), style: dayStyle),
            Text(appLocalizations.saturday, style: weekStyle),
          ],
        );
        break;
      case 6:
        text = Column(
          children: [
            Text(weekDates[6].toMDFormat(), style: dayStyle),
            Text(appLocalizations.sunday, style: weekStyle),
          ],
        );
        break;
      default:
        text = Text("", style: dayStyle);
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }
}
