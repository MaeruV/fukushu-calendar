import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckTaskAppBar extends ConsumerWidget
    with PresentationMixin
    implements PreferredSizeWidget {
  const CheckTaskAppBar({
    Key? key,
    required this.onTap,
    required this.backTap,
    required this.pallete,
  }) : super(key: key);

  final VoidCallback onTap;
  final VoidCallback backTap;
  final String pallete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("スケジュール", style: BrandText.titleSM),
      backgroundColor: TaskColorPalette.noamlPalette[pallete],
      leading: GestureDetector(
        onTap: backTap,
        child: const Icon(
          Icons.chevron_left,
          size: 32,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              "編集",
              style: BrandText.titleS.copyWith(color: BrandColor.blue),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
