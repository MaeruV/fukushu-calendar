import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/custom_keyboard_action_config.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/text_field_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskRange extends HookConsumerWidget {
  const AddTaskRange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return SizedBox(
      height: 105,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appLocalizations.review_range,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: theme.primaryColorLight),
              ),
              Text(
                appLocalizations.final_content,
                overflow: TextOverflow.ellipsis,
                style:
                    theme.textTheme.bodySmall!.copyWith(color: BrandColor.blue),
              ),
            ],
          ),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomDropDownMene(),
                CustomRangeTextField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDropDownMene extends ConsumerWidget {
  const CustomDropDownMene({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(editViewModelProvider.notifier);
    final state = ref.watch(editViewModelProvider);
    return DropdownButton(
      value: state.reviewRange,
      onChanged: (ReviewRange? value) => notifier.setReviewRange(value),
      items: ReviewRange.values.map((ReviewRange range) {
        return DropdownMenuItem<ReviewRange>(
          value: range,
          child: CustomDropdownMenuItem(reviewRange: range),
        );
      }).toList(),
    );
  }
}

class CustomDropdownMenuItem extends ConsumerWidget {
  const CustomDropdownMenuItem({super.key, required this.reviewRange});

  final ReviewRange reviewRange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Center(
      child: DropdownMenuItem(
        value: reviewRange,
        child: Text(
          reviewRange.updateSelectionText(appLocalizations),
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.primaryColorLight),
        ),
      ),
    );
  }
}

class CustomRangeTextField extends HookConsumerWidget {
  const CustomRangeTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.read(editViewModelProvider.notifier);
    final state = ref.watch(editViewModelProvider);
    final firstController = useTextEditingController(
        text: state.firstRange != null ? state.firstRange.toString() : "");
    final secoundController = useTextEditingController(
        text: state.secoundRange != null ? state.secoundRange.toString() : "");
    final appLocalizations = AppLocalizations.of(context)!;
    final FocusNode focusNode1 = useFocusNode();
    final FocusNode focusNode2 = useFocusNode();

    useEffect(() {
      firstController.text = state.firstRange?.toString() ?? "";
      return null;
    }, [state.firstRange]);

    useEffect(() {
      secoundController.text = state.secoundRange?.toString() ?? "";
      return null;
    }, [state.secoundRange]);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 80,
          child: CustomKeyboardActionConfig(
            focusNode: focusNode1,
            child: Center(
              child: TextField(
                focusNode: focusNode1,
                controller: firstController,
                cursorColor: BrandColor.blue,
                onChanged: (value) => notifier.setFirstRange(value),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: theme.primaryColorLight),
                textAlign: TextAlign.center,
                decoration: CustomInputDecoration.inputDecoration(
                    appLocalizations.start),
              ),
            ),
          ),
        ),
        const Text(' - '),
        SizedBox(
          width: 80,
          child: CustomKeyboardActionConfig(
            focusNode: focusNode2,
            child: Center(
              child: TextField(
                focusNode: focusNode2,
                controller: secoundController,
                cursorColor: BrandColor.blue,
                onChanged: (value) => notifier.setSecoundRange(value),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: theme.primaryColorLight),
                textAlign: TextAlign.center,
                decoration: CustomInputDecoration.inputDecoration(
                    appLocalizations.finish),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
