import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/view/analysis_main_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/views/calendar_custom_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/views/calendar_main_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/edit_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/views/others_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  int build() {
    return 0;
  }

  List<Widget>? get screens => _screens;

  final _screens = const [
    // CalendarCustomScreen(),
    CalendarMainScrenn(),
    EditScreen(),
    // CalendarCustomScreen(),
    SizedBox.expand(),
    AnalysisMainScreen(),
    OthersMainScreen()
  ];

  int get selectedIndex => state;

  void onItemTapped(int index) {
    state = index;
  }
}
