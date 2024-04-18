import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnalysisAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const AnalysisAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;

    final theme = Theme.of(context);
    return AppBar(
      elevation: 1.5,
      backgroundColor: theme.scaffoldBackgroundColor,
      centerTitle: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      title: Text(
        appLocalizations.analysis,
        style: theme.textTheme.titleLarge!
            .copyWith(color: theme.primaryColorLight),
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
