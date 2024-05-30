import 'package:ebbinghaus_forgetting_curve/application/config/app_constants.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/theme/custom_theme.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppearancelangPage extends ConsumerWidget {
  const AppearancelangPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.language_change,
        onBack: () => context.pop(),
      ),
      body: const AppearanceLang(),
    );
  }
}

class AppearanceLang extends ConsumerWidget {
  const AppearanceLang({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(customThemeProvider);
    final themeNotifier = ref.read(customThemeProvider.notifier);

    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            String key = languages.keys.elementAt(index);
            String displayName = languages[key]!;
            return GestureDetector(
              onTap: () => themeNotifier.updateTheme(
                fontSize: null,
                thickness: null,
                textFamily: null,
                language: key,
              ),
              child: Card(
                color: theme.highlightColor,
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text(displayName, style: theme.textTheme.bodyMedium!),
                  ),
                  trailing: themeState.language == key
                      ? const Icon(Icons.check)
                      : const SizedBox.shrink(),
                ),
              ),
            );
          }),
    );
  }
}
