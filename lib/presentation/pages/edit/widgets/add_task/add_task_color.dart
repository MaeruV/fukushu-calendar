import 'package:ebbinghaus_forgetting_curve/application/state/edit/color_picker_view_mode.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/widgets/circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskColor extends ConsumerWidget with PresentationMixin {
  const AddTaskColor({super.key});

  showColorPicker(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          Color? pickedColor;
          return AlertDialog(
            title: Text('カラー',
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
                child: Text('キャンセル',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: Colors.blue)),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('完了',
                    style:
                        theme.textTheme.bodySmall!.copyWith(color: Colors.red)),
                onPressed: () {
                  execute(context, action: () async {
                    if (pickedColor != null) {
                      ref
                          .read(colorPickerViewModelProvider.notifier)
                          .addColorPicker(pickedColor!.value);
                    }
                    Navigator.of(context).pop();
                  });
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

    List<int> combinedColors = [
      ...colorState,
      0,
      ...TaskColorPalette.normalPalette
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'カラー',
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
                          showColorPicker(context, ref);
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
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(editViewModelProvider.notifier)
                            .setPalette(combinedColors[index]);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Color(combinedColors[index]),
                        child: isSelected
                            ? const Icon(
                                Icons.check,
                                color: BrandColor.white,
                                size: 18,
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                  );
                }
              }),
        )
      ],
    );
  }
}
