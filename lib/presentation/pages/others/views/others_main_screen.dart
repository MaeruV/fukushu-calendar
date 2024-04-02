import 'package:ebbinghaus_forgetting_curve/application/config/app_constants.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OthersMainScreen extends ConsumerWidget {
  const OthersMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 1.5,
        centerTitle: true,
        title: Text('メニュー',
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.primaryColorLight)),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          ListTile(
            onTap: () => context.push('/others_setting'),
            leading: const Icon(
              Icons.settings,
              color: BrandColor.grey,
              size: 25,
            ),
            title: Text(
              settingTitle,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColorLight),
            ),
            trailing: const Icon(Icons.chevron_right, size: 30),
          ),
          ListTile(
            onTap: () => context.push('/others_copyright'),
            leading: const Icon(
              Icons.copyright,
              color: BrandColor.grey,
              size: 25,
            ),
            title: Text(
              copyright,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColorLight),
            ),
            trailing: const Icon(Icons.chevron_right, size: 30),
          ),
        ],
      ),
    );
  }
}
