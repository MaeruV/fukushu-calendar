import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/modal_manager.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntervalFloatingBtn extends ConsumerWidget with PresentationMixin {
  const IntervalFloatingBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(intervalViewModelProvider.notifier);
    final state = ref.watch(intervalViewModelProvider);
    final ModalManager modalManager = ModalManager();
    final appLocalizations = AppLocalizations.of(context)!;

    int selectedValue = 1;

    return state.selectInterval?.id == 1
        ? const SizedBox.shrink()
        : FloatingActionButton(
            onPressed: () {
              modalManager.showModalPicker(
                context: context,
                cancelTap: () => context.pop(),
                doneTap: (ctx) {
                  context.pop();
                  notifier.setNumber(
                    num: selectedValue,
                    context: ctx,
                    sameNumContent: appLocalizations.same_num_content,
                    maxLengthContent: appLocalizations.max_length_content,
                  );
                },
                selectedTap: (ctx) {
                  context.pop();
                  notifier.setNumber(
                    num: selectedValue,
                    context: ctx,
                    sameNumContent: appLocalizations.same_num_content,
                    maxLengthContent: appLocalizations.max_length_content,
                  );
                },
                onSelectedItemChanged: (index) {
                  selectedValue = index + 1;
                },
              );
            },
            backgroundColor: BrandColor.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.add,
              color: BrandColor.white,
            ),
          );
  }
}
