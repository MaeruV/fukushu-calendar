import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/intercal_floating_btn.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/interval_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/interval_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntervalScreen extends ConsumerStatefulWidget {
  const IntervalScreen({super.key});

  @override
  IntervalScreenState createState() => IntervalScreenState();
}

class IntervalScreenState extends ConsumerState<IntervalScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(intervalViewModelProvider.notifier).initializeInteval();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: IntervalAppBar(),
      body: IntervalView(),
      floatingActionButton: IntervalFloatingBtn(),
    );
  }
}
