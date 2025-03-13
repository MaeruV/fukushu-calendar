import 'package:ebbinghaus_forgetting_curve/application/config/app_constants.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/theme/custom_theme.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/intervals/state/intervals_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/intervals.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OthersAppearance extends ConsumerWidget {
  const OthersAppearance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          appLocalizations.appearance,
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.primaryColorLight),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: theme.highlightColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: const Column(
            children: <Widget>[
              OthersDarkMode(),
              Divider(),
              OthersFontSizes(),
              Divider(),
              OthersFonts(),
              Divider(),
              OthersLanguage(),
              Divider(),
              OthersIntervals(),
            ],
          ),
        ),
      ],
    );
  }
}

class OthersDarkMode extends ConsumerWidget {
  const OthersDarkMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeNotifier = ref.read(customThemeProvider.notifier);
    final themeState = ref.watch(customThemeProvider);
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              appLocalizations.dark_mode,
              style: theme.textTheme.labelLarge!
                  .copyWith(color: theme.primaryColorLight),
            ),
            Switch(
              value: themeState.currentTheme == 'light' ? false : true,
              onChanged: (flag) {
                if (flag) {
                  themeNotifier.apply('dark');
                } else {
                  themeNotifier.apply('light');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OthersFontSizes extends ConsumerWidget with PresentationMixin {
  const OthersFontSizes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeState = ref.watch(customThemeProvider);
    final appLocalizations = AppLocalizations.of(context)!;
    final formatThickness = themeState.thickness == 'thin'
        ? appLocalizations.thin
        : appLocalizations.thick;

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () async => checkSnackBar(
          action: () => context.push('/appearance_font_size'),
          scaffoldMessenger: ScaffoldMessenger.of(context),
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  appLocalizations.text_size,
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: theme.primaryColorLight),
                ),
              ),
              Row(
                children: [
                  Text(
                    '${themeState.fontSize.toInt().toString()} px, $formatThickness',
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: theme.primaryColorLight,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OthersFonts extends ConsumerWidget with PresentationMixin {
  const OthersFonts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeState = ref.watch(customThemeProvider);
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () async => checkSnackBar(
          action: () => context.push('/appearance_fonts_family'),
          scaffoldMessenger: ScaffoldMessenger.of(context),
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  appLocalizations.font,
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: theme.primaryColorLight),
                ),
              ),
              Row(
                children: [
                  Text(themeState.textFamily,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.grey)),
                  Icon(
                    Icons.chevron_right,
                    color: theme.primaryColorLight,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OthersLanguage extends ConsumerWidget with PresentationMixin {
  const OthersLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeState = ref.watch(customThemeProvider);
    final appLocalizations = AppLocalizations.of(context)!;
    String displayName = languages[themeState.language] ?? '日本語';

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () async => checkSnackBar(
          action: () => context.push('/appearance_lang'),
          scaffoldMessenger: ScaffoldMessenger.of(context),
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  appLocalizations.language_change,
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: theme.primaryColorLight),
                ),
              ),
              Row(
                children: [
                  Text(displayName,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.grey)),
                  Icon(
                    Icons.chevron_right,
                    color: theme.primaryColorLight,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OthersIntervals extends ConsumerWidget with PresentationMixin {
  const OthersIntervals({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final config = ref.watch(fetchDefaultIntervalProvider);

    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        if (value == null) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: GestureDetector(
            onTap: () async => checkSnackBar(
              action: () => context.push('/appearance_interval'),
              scaffoldMessenger: ScaffoldMessenger.of(context),
            ),
            child: SizedBox(
              height: 50,
              child: Row(
                children: <Widget>[
                  Text(
                    appLocalizations.interval,
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: theme.primaryColorLight),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _formatInterval(value, context),
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: theme.primaryColorLight,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      default:
        return const CircularProgressIndicator();
    }
  }

  String _formatInterval(Intervals interval, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final formattedIntervals =
        interval.nums.map((interval) => '$interval').join(', ');
    return '$formattedIntervals${appLocalizations.days_after}';
  }
}
