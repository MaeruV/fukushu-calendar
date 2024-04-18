import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/modal_manager.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IntervalFloatingBtn extends ConsumerWidget {
  const IntervalFloatingBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(intervalViewModelProvider.notifier);
    final ModalManager modalManager = ModalManager();

    int selectedValue = 1;

    return FloatingActionButton(
      onPressed: () {
        modalManager.showModalPicker(
          context: context,
          cancelTap: () => context.pop(),
          doneTap: (ctx) {
            context.pop();
            notifier.setNumber(selectedValue, ctx);
          },
          selectedTap: (ctx) {
            context.pop();
            notifier.setNumber(selectedValue, ctx);
          },
          onSelectedItemChanged: (index) {
            selectedValue = index + 1;
          },
        );
      },
      backgroundColor: BrandColor.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50), //角の丸み
      ),
      child: const Icon(
        Icons.add,
        color: BrandColor.white,
      ),
    );
  }
}
