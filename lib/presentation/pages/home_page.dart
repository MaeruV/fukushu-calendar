import 'package:ebbinghaus_forgetting_curve/application/state/home/home_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ja');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final height = MediaQuery.of(context).size.height;
      final top = MediaQuery.of(context).padding.top;
      ref.read(screenViewModelProvider.notifier).setScreenSize(height, top);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    final notifier = ref.read(homeViewModelProvider.notifier);

    return Scaffold(
      body: IndexedStack(
        index: state,
        children: notifier.screens!,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        backgroundColor: BrandColor.white,
        selectedItemColor: BrandColor.blue,
        currentIndex: state,
        onTap: notifier.onItemTapped,
      ),
    );
  }
}
