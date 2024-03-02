import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskNav extends ConsumerWidget {
  const AddTaskNav({
    super.key,
    required this.back,
    required this.complite,
    required this.title,
    required this.backTap,
    required this.compliteTap,
  });
  final String back;
  final String complite;
  final String title;
  final VoidCallback backTap;
  final VoidCallback compliteTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: backTap,
            child: Text(
              back,
              style: BrandText.titleS.copyWith(color: BrandColor.blue),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(title, style: BrandText.titleSM),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: compliteTap,
            child: Text(
              complite,
              style: BrandText.titleS.copyWith(color: BrandColor.blue),
            ),
          ),
        ),
      ],
    );
  }
}
