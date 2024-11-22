import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckTaskReviewRange extends ConsumerWidget {
  const CheckTaskReviewRange({
    super.key,
    required this.reviewRange,
    required this.firstRange,
    required this.secoundRange,
  });

  final ReviewRange reviewRange;
  final int? firstRange;
  final int? secoundRange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    final formatRange =
        "$firstRange ${secoundRange != null ? "- $secoundRange" : ""} ${reviewRange.updateSelectionText(appLocalizations)}";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          appLocalizations.review_range,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.primaryColorLight),
        ),
        Text(
          formatRange,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.primaryColorLight),
        ),
      ],
    );
  }
}
