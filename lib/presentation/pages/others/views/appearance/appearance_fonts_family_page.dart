import 'package:ebbinghaus_forgetting_curve/application/state/theme/custom_theme.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppearanceFontsFamilyPage extends ConsumerWidget {
  const AppearanceFontsFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.font,
        onBack: () => context.pop(),
      ),
      body: const AppearanceFontsFamily(),
    );
  }
}

class AppearanceFontsFamily extends ConsumerWidget {
  const AppearanceFontsFamily({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(customThemeProvider);
    final themeNotifier = ref.read(customThemeProvider.notifier);
    final appLocalizations = AppLocalizations.of(context)!;

    final List<String> fonts = [
      'Inter',
      'Zen_Kaku_Gothic_New',
      'Kiwi_Maru',
      'Kaisei_Opti',
      'Reggae_One',
      'Yuji_Syuku_selection',
      'Noto',
    ];

    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: ListView.builder(
          itemCount: fonts.length,
          itemBuilder: (context, index) {
            final String displayName = fonts[index].replaceAll('_', ' ');

            return GestureDetector(
              onTap: () => themeNotifier.updateTheme(
                fontSize: null,
                thickness: null,
                textFamily: fonts[index],
                language: null,
              ),
              child: Card(
                color: theme.highlightColor,
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: displayName,
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontFamily: fonts[index]),
                        children: fonts[index] == 'Inter'
                            ? [
                                TextSpan(
                                    text:
                                        '  (${appLocalizations.font_default})',
                                    style: theme.textTheme.bodySmall!.copyWith(
                                      color: Colors.grey,
                                      fontFamily: fonts[index],
                                    )),
                              ]
                            : [],
                      ),
                    ),
                  ),
                  trailing: themeState.textFamily == fonts[index]
                      ? const Icon(Icons.check)
                      : const SizedBox.shrink(),
                ),
              ),
            );
          }),
    );
  }
}
