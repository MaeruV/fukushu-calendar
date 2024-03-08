import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskColor extends ConsumerWidget {
  const AddTaskColor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'カラー',
          style: BrandText.bodyM,
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 55,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: TaskColorPalette.noamlPalette.length,
              itemBuilder: (context, index) {
                final isSelected =
                    TaskColorPalette.lightPalette.keys.elementAt(index) ==
                        state.pallete;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      ref.read(editViewModelProvider.notifier).setPalette(
                          TaskColorPalette.noamlPalette.keys.elementAt(index));
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor:
                          TaskColorPalette.noamlPalette.values.elementAt(index),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: BrandColor.black,
                              size: 18,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
