import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckTaskStartDay extends ConsumerWidget {
  const CheckTaskStartDay({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: 80,
          child: Text(
            appLocalizations.start_date,
            style: BrandText.bodyM.copyWith(
              color: theme.primaryColorLight,
            ),
          ),
        ),
        Text(
          date.toSimpleFormat(appLocalizations.date),
          style: BrandText.bodyM.copyWith(color: BrandColor.deleteRed),
        ),
      ],
    );
  }
}
