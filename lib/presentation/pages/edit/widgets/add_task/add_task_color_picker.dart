import 'package:ebbinghaus_forgetting_curve/application/state/edit/color_picker_view_mode.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/dialog_manager.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:badges/badges.dart' as badges;

class AddTaskColorPicker extends HookConsumerWidget {
  const AddTaskColorPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final colorState = ref.watch(colorPickerViewModelProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final dialogManager = DialogManager();
    final selectColor = useState(0);

    return SizedBox(
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            appLocalizations.color,
            style: theme.textTheme.bodySmall!
                .copyWith(color: theme.primaryColorLight),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => dialogManager.showColorPicker(
                    context: context,
                    selectColor: Color(state.pallete),
                    hedingText: appLocalizations.select_color,
                    subheadingText: appLocalizations.select_color_shade,
                    doneText: appLocalizations.complete,
                    textStyle: theme.textTheme.titleSmall!
                        .copyWith(color: BrandColor.deleteRed),
                    onColorChanged: (color) => selectColor.value = color.value,
                    doneBtn: () {
                      if (selectColor.value != 0) {
                        ref
                            .read(colorPickerViewModelProvider.notifier)
                            .addColorPicker(selectColor.value);
                        ref
                            .read(editViewModelProvider.notifier)
                            .setPalette(selectColor.value);
                      }
                      context.pop();
                    },
                  ),
                  child: const AddColorCircleWidget(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(colorState.length, (index) {
                        final isSelected = colorState[index] == state.pallete;
                        return GestureDetector(
                          onTap: () => ref
                              .read(editViewModelProvider.notifier)
                              .setPalette(colorState[index]),
                          child: ListViewColorPickers(
                            colorValue: colorState[index],
                            isSelected: isSelected,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddColorCircleWidget extends StatelessWidget {
  const AddColorCircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: theme.primaryColorLight),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.add,
        color: theme.primaryColorLight,
        size: 30,
      ),
    );
  }
}

class ListViewColorPickers extends StatelessWidget {
  const ListViewColorPickers(
      {super.key, required this.colorValue, required this.isSelected});

  final int colorValue;
  final bool isSelected;

  Widget circleContainer() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(colorValue),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return isSelected
        ? badges.Badge(
            position: badges.BadgePosition.topEnd(top: 5, end: -5),
            showBadge: true,
            ignorePointer: false,
            badgeContent: Icon(
              Icons.check,
              color: theme.primaryColorLight,
              size: 15,
            ),
            badgeStyle: badges.BadgeStyle(
              elevation: 10,
              borderSide: BorderSide(color: Color(colorValue), width: 2),
              badgeColor: theme.canvasColor,
            ),
            child: circleContainer())
        : circleContainer();
  }
}
