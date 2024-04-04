import 'package:ebbinghaus_forgetting_curve/application/state/others/others_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OthersAppearance extends ConsumerWidget {
  const OthersAppearance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '外見',
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
              OthersThickness(),
              Divider(),
              OthersFonts(),
              Divider(),
              OthersLanguage(),
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

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'ダークモード',
              style: theme.textTheme.labelLarge!
                  .copyWith(color: theme.primaryColorLight),
            ),
            Switch(
              value: ref.watch(othersViewModelProvider).darkMode,
              onChanged: (flag) {
                ref.read(othersViewModelProvider.notifier).setDarkMode(flag);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OthersFontSizes extends ConsumerWidget {
  const OthersFontSizes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () => context.push('/appearance_font_size'),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  '文字の大きさ',
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: theme.primaryColorLight),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.primaryColorLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OthersThickness extends ConsumerWidget {
  const OthersThickness({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '文字の太さ',
                style: theme.textTheme.labelLarge!
                    .copyWith(color: theme.primaryColorLight),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.primaryColorLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OthersFonts extends ConsumerWidget {
  const OthersFonts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'フォント',
                style: theme.textTheme.labelLarge!
                    .copyWith(color: theme.primaryColorLight),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.primaryColorLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OthersLanguage extends ConsumerWidget {
  const OthersLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '言語の変更',
                style: theme.textTheme.labelLarge!
                    .copyWith(color: theme.primaryColorLight),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.primaryColorLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
