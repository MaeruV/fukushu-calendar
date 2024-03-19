import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckTaskNav extends ConsumerWidget {
  const CheckTaskNav({
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
    final size = ref.watch(screenViewModelProvider);

    return Container(
      color: TaskColorPalette.normalPalette[pallete]!.withOpacity(0.3),
      padding: EdgeInsets.only(
          top: size.safeAreaTop + 20, bottom: 20, left: 15, right: 15),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: backTap,
              child: const Icon(
                Icons.chevron_left,
                size: 30,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text('スケジュール', style: BrandText.titleSM),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                "編集",
                style: BrandText.titleS.copyWith(color: BrandColor.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
