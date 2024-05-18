import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/task_selection_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/loading.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_top_container.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_view.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final editTodayKeyProvider = StateProvider((ref) => GlobalKey());

class EditScreen extends HookConsumerWidget {
  const EditScreen({super.key});

  void deleteSelectedTasks(WidgetRef ref, AppLocalizations appLocalizations) {
    final selectedTask = ref.watch(taskSelectionViewModelProvider);
    final state = ref.watch(analysisViewModelProvider);

    for (var task in selectedTask.keys) {
      if (selectedTask[task] == true) {
        ref.read(taskUsecaseProvider).deleteTaskEvent(
            task, state.dateTimeTapped, state.range, appLocalizations);
      }
    }
    ref.read(taskSelectionViewModelProvider.notifier).clearSelections();
    ref.read(editTaskAllProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(tasksProvider);
    final isLoading = ref.watch(overlayLoadingProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

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
              Positioned(
                bottom: 10,
                right: 20,
                child: GestureDetector(
                  onTap: () => deleteSelectedTasks(ref, appLocalizations),
                  child: const AnimationFloationDeleteButton(),
                ),
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

class AnimationFloationDeleteButton extends HookConsumerWidget {
  const AnimationFloationDeleteButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedTask = ref.watch(taskSelectionViewModelProvider);
    final countTask = selectedTask.values.where((value) => value).length;

    final controller =
        useAnimationController(duration: const Duration(milliseconds: 100));
    final tweenAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);

    ref.listen(editTaskAllProvider, (previous, next) {
      if (next) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: tweenAnimation.value,
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -15, end: -10),
              badgeContent: Text(countTask.toString(),
                  style: theme.textTheme.titleSmall!
                      .copyWith(color: theme.primaryColorDark)),
              badgeStyle: badges.BadgeStyle(
                padding: const EdgeInsets.all(8.0),
                badgeColor: theme.primaryColorLight,
              ),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: BrandColor.deleteRed,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.delete_forever,
                  color: BrandColor.white,
                ),
              ),
            ),
          );
        });
  }
}
