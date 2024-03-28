import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/loading.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_add_task_button.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_top_container.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final editTodayKeyProvider = StateProvider((ref) => GlobalKey());

class EditScreen extends HookConsumerWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(tasksProvider);
    final isLoading = ref.watch(overlayLoadingProvider);
    final theme = Theme.of(context);

    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        return Scaffold(
          appBar: EditTopContainer(value: value),
          body: Stack(
            children: [
              RefreshIndicator(
                  color: theme.focusColor,
                  onRefresh: () async => ref.invalidate(tasksProvider),
                  child: EditView(value: value)),
              const Positioned(
                bottom: 20,
                right: 20,
                child: EditAddTaskButton(),
              ),
              if (isLoading) const OverlayLoading(),
            ],
          ),
        );
      default:
        return const CircularProgressIndicator();
    }
  }
}
