import 'package:ebbinghaus_forgetting_curve/application/config/app_constants.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/others/others_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OthersSettingScreen extends ConsumerWidget {
  const OthersSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(
            Icons.chevron_left,
            color: theme.primaryColorLight,
            size: 30,
          ),
        ),
        title: Text(
          settingTitle,
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.primaryColorLight),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
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
