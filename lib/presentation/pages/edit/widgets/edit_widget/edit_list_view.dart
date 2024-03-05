import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

enum SlidableActionPropaties {
  edit,
  delete,
}

class EditListView extends ConsumerWidget {
  const EditListView({super.key, required this.dateTime, required this.tasks});

  final DateTime dateTime;
  final List<Task> tasks;

  Color todayColor() {
    final now = DateTime.now();
    final taskDate = dateTime;

    if (taskDate.year == now.year &&
        taskDate.month == now.month &&
        taskDate.day == now.day) {
      return BrandColor.deleteRed;
    } else {
      return BrandColor.grey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dateTime.toRelativeJapaneseFormat(),
            style: BrandText.titleM.copyWith(color: todayColor()),
          ),
        ),
        EditSlidableAction(tasks: tasks),
        Container(
          height: 2,
          color: BrandColor.grey.withOpacity(0.5),
        ),
      ],
    );
  }
}

class EditSlidableAction extends ConsumerWidget with PresentationMixin {
  const EditSlidableAction({super.key, required this.tasks});
  final List<Task> tasks;

  void onPressed(
    WidgetRef ref,
    BuildContext context,
    SlidableActionPropaties action,
    Task task,
  ) async {
    switch (action) {
      case SlidableActionPropaties.edit:
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The edit button was tapped!!')));
        break;
      case SlidableActionPropaties.delete:
        final controller = Slidable.of(context);
        controller!.dismiss(
          ResizeRequest(const Duration(milliseconds: 300), () async {
            await ref.read(taskUsecaseProvider).deleteTaskEvent(task.id);
          }),
          duration: const Duration(milliseconds: 300),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: tasks
          .map(
            (task) => Slidable(
              key: UniqueKey(),
              endActionPane: ActionPane(
                extentRatio: 0.5,
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                dragDismissible: false,
                children: [
                  SlidableAction(
                    onPressed: (context) => onPressed(
                        ref, context, SlidableActionPropaties.edit, task),
                    backgroundColor: BrandColor.moreGrey,
                    foregroundColor: BrandColor.white,
                    icon: Icons.more_horiz,
                    label: '編集',
                  ),
                  SlidableAction(
                    autoClose: false,
                    onPressed: (context) => onPressed(
                        ref, context, SlidableActionPropaties.delete, task),
                    backgroundColor: BrandColor.deleteRed,
                    foregroundColor: BrandColor.white,
                    icon: Icons.delete_forever,
                    label: '削除',
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () async {
                  context.push('/check_task', extra: task);
                },
                child: MainTaskWidget(task: task),
              ),
            ),
          )
          .toList(),
    );
  }
}

class MainTaskWidget extends ConsumerWidget {
  const MainTaskWidget({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formattedIntervals =
        task.dates.map((interval) => '$interval').join(', ');

    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: BrandColor.blue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                task.title,
                style: BrandText.bodyL,
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                '復習間隔',
                style: BrandText.bodyM,
              ),
              const SizedBox(width: 20),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  formattedIntervals,
                  style: BrandText.bodyM,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Text(
                "日後",
                style: BrandText.bodyM,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
