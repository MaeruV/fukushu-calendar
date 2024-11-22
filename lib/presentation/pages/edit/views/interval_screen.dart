import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/intercal_floating_btn.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/interval_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/interval_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntervalScreen extends ConsumerWidget {
  const IntervalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
        appBar: IntervalAppBar(),
        body: IntervalView(),
        floatingActionButton: IntervalFloatingBtn());
  }
}
