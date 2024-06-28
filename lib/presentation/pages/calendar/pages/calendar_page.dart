import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/widgets/calendar_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/widgets/calendar_weekday_display.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/widgets/container_body.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//列挙型
enum ScrollDirection { left, right, none }

//Provider
//CalendarPageViewのindexを格納
final currentPageProvider = StateProvider<int>((ref) => 1200);
// AnimationContainerの変動する高さをtopContainerHeightFactorProviderで監視
final topContainerHeightFactorProvider = StateProvider<double>((_) => 0.7);
// MonthとWeekの切り替えを監視するProvider
final collapsedProvider = StateProvider<bool>((ref) => false);
// CalendarDayでタップしたセルのProvider
final tappedCellProvider = StateProvider<Map<int, DateTime>>((ref) => {});
// CalendarTableのinitで生成したweeksProvider
final weeksProvider = StateProvider<List<List<DateTime>>>((_) => []);
//MonthPageViewでタップした日付のrowの行番号を格納
final currentRowIndexProvider = StateProvider<int>((ref) => 0);
//スクロールしている方向を格納する
final scrollDirectionProvider =
    StateProvider<ScrollDirection>((ref) => ScrollDirection.none);
// 今日のボタンが押されたかを確認する
final todayFlagProvider = StateProvider<bool>((ref) => false);
//今日の日付のrowIndexを格納
final todayRowIndexProvider = StateProvider<int>((ref) => 0);

final sameMonthIndexProvider = StateProvider<int?>((ref) => null);

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CalendarAppBar(),
      body: Column(
        children: <Widget>[
          const CalendarWeekdayDisplay(),
          Container(
            height: 0.5,
            color: BrandColor.grey,
          ),
          const CalendarBody(),
        ],
      ),
    );
  }
}
