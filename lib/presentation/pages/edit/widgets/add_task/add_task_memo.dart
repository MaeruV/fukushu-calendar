import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../common/custom_hook_text_field.dart';

class AddTaskMemo extends HookConsumerWidget {
  const AddTaskMemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoText = ref.watch(editViewModelProvider).memo;
    final notifier = ref.read(editViewModelProvider.notifier);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final controller = useCustomTextEditingController(text: memoText);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appLocalizations.memo,
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.primaryColorLight),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 80,
          child: TextField(
            style: theme.textTheme.bodySmall!
                .copyWith(color: theme.primaryColorLight),
            controller: controller,
            onChanged: (value) => notifier.setMemoText(value),
            maxLength: 100,
            decoration: InputDecoration(
              hintText: appLocalizations.memo_content,
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
