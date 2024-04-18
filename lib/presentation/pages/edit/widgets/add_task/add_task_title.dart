import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskTitle extends HookConsumerWidget {
  const AddTaskTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(editViewModelProvider.notifier);
    final state = ref.watch(editViewModelProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final controller = useTextEditingController(text: state.title);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appLocalizations.title,
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.primaryColorLight),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 80,
          child: TextField(
            style: theme.textTheme.bodySmall!
                .copyWith(color: theme.primaryColorLight),
            maxLength: 20,
            controller: controller,
            onChanged: (value) => notifier.setTitleText(value),
            decoration: InputDecoration(
              hintText: appLocalizations.title_content,
              hintStyle: BrandText.bodyS.copyWith(color: BrandColor.grey),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: BrandColor.grey),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: BrandColor.blue)),
            ),
          ),
        ),
      ],
    );
  }
}
