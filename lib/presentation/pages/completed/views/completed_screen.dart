import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/completed/views/widgets/comp_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/completed/views/widgets/comp_list_view.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompletedScreen extends ConsumerWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(compTaskDatesProvider);

    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        return Scaffold(
          appBar: CompAppBar(mapEvents: value),
          body: Container(
            color: BrandColor.background,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async =>
                          ref.invalidate(compTaskDatesProvider),
                      child: ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          var entry = value.entries.elementAt(index);
                          var date = entry.key;
                          var taskDates = entry.value;
                          return CompListView(
                              dateTime: date, taskDates: taskDates);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      default:
        return const CircularProgressIndicator();
    }
  }
}
