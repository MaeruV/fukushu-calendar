import 'package:ebbinghaus_forgetting_curve/application/state/edit/task_selection_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTopContainer extends ConsumerWidget implements PreferredSizeWidget {
  const EditTopContainer({super.key, required this.value});

  final Map<DateTime, List<Task>> value;

  String getTotalTaskCount(Map<DateTime, List<Task>> allTasks) {
    int totalTaskCount = allTasks.values.fold(0,
        (sum, list) => sum + list.where((task) => !task.completedEvent).length);
    return totalTaskCount.toString();
  }

  void todayTaskIndex(WidgetRef ref) async {
    final now = DateTime.now();
    final todayTaskExists = value.entries.any((entry) =>
        entry.key.year == now.year &&
        entry.key.month == now.month &&
        entry.key.day == now.day);

    if (todayTaskExists) {
      final context = ref.watch(editTodayKeyProvider).currentContext;
      if (context != null) {
        await Scrollable.ensureVisible(context,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return AppBar(
      elevation: 1.5,
      centerTitle: false,
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      actions: [
        Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () => todayTaskIndex(ref),
                  child: Text(
                    appLocalizations.today,
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(taskSelectionViewModelProvider.notifier)
                        .clearSelections();

                    ref.read(editTaskAllProvider.notifier).state =
                        !ref.watch(editTaskAllProvider);
                  },
                  child: Text(
                    ref.read(editTaskAllProvider)
                        ? appLocalizations.cancel
                        : appLocalizations.edit,
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: theme.primaryColorLight),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text(
                  '${appLocalizations.number_of_events}  ${getTotalTaskCount(value)}',
                  style:
                      theme.textTheme.bodyMedium!.copyWith(color: Colors.grey),
                ),
              ],
            ),
          )),
      title: Text(
        appLocalizations.schedule,
        style: theme.textTheme.titleLarge!
            .copyWith(color: theme.primaryColorLight),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
