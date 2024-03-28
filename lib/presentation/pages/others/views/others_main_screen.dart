import 'package:ebbinghaus_forgetting_curve/application/config/app_constants.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/icons.dart';
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
        title: Text('設定',
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.primaryColorLight)),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          ListTile(
            onTap: () => context.push('/others_mode'),
            leading: BrandIcon.hudeIcon,
            title: Text(
              darkModeScreenTitle,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColorLight),
            ),
            subtitle: Text(
              darkModeScreenContenet,
              style: theme.textTheme.bodySmall!.copyWith(color: Colors.grey),
            ),
            trailing: const Icon(Icons.chevron_right, size: 30),
          ),
          ListTile(
            onTap: () => context.push('/others_notification'),
            leading: const Icon(
              Icons.notifications_active,
              color: Colors.grey,
            ),
            title: Text(
              notificationTitle,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColorLight),
            ),
            subtitle: Text(
              notificationContent,
              style: theme.textTheme.bodySmall!.copyWith(color: Colors.grey),
            ),
            trailing: const Icon(Icons.chevron_right, size: 30),
          ),
        ],
      ),
    );
  }
}
