import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckTaskAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CheckTaskAppbar(
      {super.key, required this.backTap, required this.onTap});

  final VoidCallback backTap;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: theme.canvasColor,
      elevation: 1.0,
      leading: GestureDetector(
        onTap: backTap,
        child: Icon(
          Icons.chevron_left,
          size: 35,
          color: theme.primaryColorLight,
        ),
      ),
      title: Text(appLocalizations.schedule,
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.primaryColorLight)),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                appLocalizations.edit,
                style: theme.textTheme.titleSmall!
                    .copyWith(color: BrandColor.blue),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
