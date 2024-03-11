import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/views/calender_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/completed/views/completed_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/edit_screen.dart';
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

  final _screens = [
    const CalendarScreen(),
    const EditScreen(),
    const CompletedScreen(),
  ];

  int get selectedIndex => state;

  void onItemTapped(int index) {
    state = index;
  }
}
