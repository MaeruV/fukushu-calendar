import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckTaskMemo extends ConsumerWidget {
  const CheckTaskMemo({super.key, required this.memo});

  final String? memo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appLocalizations.memo,
          style: BrandText.bodyM.copyWith(color: BrandColor.grey),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: memo != null
              ? Text(
                  memo!,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.primaryColorLight),
                )
              : const Text(''),
        ),
      ],
    );
  }
}
