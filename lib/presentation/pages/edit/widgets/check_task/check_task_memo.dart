import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckTaskMemo extends ConsumerWidget {
  const CheckTaskMemo({super.key, required this.memo});

  final String? memo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'メモ',
          style: BrandText.bodyM,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: memo != null
              ? Text(
                  memo!,
                  style: BrandText.bodyM.copyWith(color: BrandColor.black),
                )
              : Text(
                  '',
                  style: BrandText.bodyM.copyWith(color: BrandColor.grey),
                ),
        ),
      ],
    );
  }
}
