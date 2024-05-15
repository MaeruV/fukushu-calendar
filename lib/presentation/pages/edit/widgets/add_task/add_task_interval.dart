import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskInterval extends ConsumerWidget {
  const AddTaskInterval({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    final formattedIntervals =
        '${state.intervalDays.map((interval) => '$interval').join(', ')} ${appLocalizations.days_after}';

    return GestureDetector(
      onTap: () => context.push('/interval'),
      child: SizedBox(
        height: 105,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              appLocalizations.review_period,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: theme.primaryColorLight),
            ),
            const SizedBox(height: 5),
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: BrandColor.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      formattedIntervals,
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: theme.primaryColorLight),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(
                    Icons.calendar_view_week_rounded,
                    color: BrandColor.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
