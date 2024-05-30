import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/edit_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditView extends ConsumerWidget {
  const EditView({super.key, required this.value});

  final Map<DateTime, List<Task>> value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              var entry = value.entries.elementAt(index);
              var date = entry.key;
              var tasks = entry.value;

              final key = date.year == DateTime.now().year &&
                      date.month == DateTime.now().month &&
                      date.day == DateTime.now().day
                  ? ref.watch(editTodayKeyProvider)
                  : null;

              return EditListView(
                dateTime: date,
                tasks: tasks,
                key: key,
              );
            },
          ),
        ),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}
