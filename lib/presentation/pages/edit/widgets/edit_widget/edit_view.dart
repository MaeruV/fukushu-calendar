import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditView extends ConsumerWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(tasksProvider);
    return switch (config) {
      AsyncError(:final error) => Text('Error: $error'),
      AsyncData(:final value) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(tasksProvider),
          child: ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              var entry = value.entries.elementAt(index);
              var date = entry.key;
              var tasks = entry.value;
              return EditListView(dateTime: date, tasks: tasks);
            },
          ),
        ),
      _ => const CircularProgressIndicator(),
    };
  }
}
