import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_calendar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_color_picker.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_interval.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_memo.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_notification.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_range.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_sliver_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskModalScreen extends HookConsumerWidget {
  const AddTaskModalScreen({
    super.key,
    required this.parentContext,
  });

  final BuildContext parentContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final safeArea = ref.watch(screenViewModelProvider);

    final double maxChildSize =
        (safeArea.mediaHeight - safeArea.safeAreaTop) / safeArea.mediaHeight;

    return DraggableScrollableSheet(
        maxChildSize: maxChildSize.clamp(0.0, 1.0),
        initialChildSize: maxChildSize.clamp(0.0, 1.0),
        expand: false,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            height: safeArea.mediaHeight - safeArea.safeAreaTop,
            child: CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                const AddTaskSliverAppBar(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: AddTaskTitle(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: AddTaskRange(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: AddTaskMemo(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: AddTaskCalendar(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: AddTaskInterval(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: AddTaskColorPicker(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: AddTaskNotification(),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
