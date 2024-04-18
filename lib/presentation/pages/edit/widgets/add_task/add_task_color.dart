import 'package:ebbinghaus_forgetting_curve/application/state/edit/color_picker_view_mode.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/widgets/circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskColor extends ConsumerWidget with PresentationMixin {
  const AddTaskColor({super.key});

  showColorPicker(
      BuildContext context, WidgetRef ref, Function(Color?) onPressed) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          Color? pickedColor;
          return AlertDialog(
            title: Text(appLocalizations.color,
                style: theme.textTheme.titleMedium!
                    .copyWith(color: theme.primaryColorLight)),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: const Color(0xFFFFFFFF),
                onColorChanged: (color) {
                  pickedColor = color;
                },
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(appLocalizations.cancel,
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: Colors.blue)),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text(appLocalizations.complete,
                    style:
                        theme.textTheme.bodySmall!.copyWith(color: Colors.red)),
                onPressed: () {
                  onPressed.call(pickedColor);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final colorState = ref.watch(colorPickerViewModelProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    List<int> combinedColors = [
      ...colorState,
      0,
      ...TaskColorPalette.normalPalette
    ];

    for (var element in combinedColors) {
      print("Color: $element");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          appLocalizations.color,
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.primaryColorLight),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 55,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: combinedColors.length,
              itemBuilder: (context, index) {
                final isSelected =
                    combinedColors.elementAt(index) == state.pallete;
                if (index == colorState.length) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showColorPicker(
                            context,
                            ref,
                            (pickedColor) async {
                              if (pickedColor != null) {
                                ref
                                    .read(colorPickerViewModelProvider.notifier)
                                    .addColorPicker(pickedColor.value);
                                ref
                                    .read(editViewModelProvider.notifier)
                                    .setPalette(pickedColor.value);
                              }
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        child: const Center(
                          child: CustomPaint(
                            size: Size(30, 30),
                            painter: CirclePickerPainter(),
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        child: VerticalDivider(
                          width: 8,
                          thickness: 2,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () {
                            ref
                                .read(editViewModelProvider.notifier)
                                .setPalette(combinedColors[index]);
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        Color(combinedColors[index]),
                                  ),
                                ),
                                Positioned(
                                  top: -5,
                                  right: -5,
                                  child: isSelected
                                      ? Icon(
                                          Icons.check_circle,
                                          color: theme.primaryColorLight,
                                          size: 18,
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }),
        )
      ],
    );
  }
}
