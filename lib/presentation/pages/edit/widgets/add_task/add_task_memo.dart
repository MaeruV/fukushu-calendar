import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskMemo extends HookConsumerWidget {
  const AddTaskMemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoText = ref.watch(editViewModelProvider).memo;
    final notifier = ref.read(editViewModelProvider.notifier);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final controller = useTextEditingController(text: memoText);
    useEffect(() {
      controller.addListener(() {
        notifier.setMemoText(controller.text);
      });
      return null;
    }, []);

    return SizedBox(
      height: 105,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appLocalizations.memo,
            style: theme.textTheme.bodySmall!
                .copyWith(color: theme.primaryColorLight),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: TextField(
              controller: controller,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColorLight),
              maxLength: 100,
              maxLines: 1,
              cursorColor: BrandColor.blue,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                isDense: true,
                hintText: appLocalizations.teaching_materials_content,
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
      ),
    );
  }
}
