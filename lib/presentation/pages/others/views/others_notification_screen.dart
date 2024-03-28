import 'package:ebbinghaus_forgetting_curve/application/config/app_constants.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/others/others_notification_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/others/others_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OthersNotificationScreen extends ConsumerWidget {
  const OthersNotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final viewModel = ref.watch(othersNotificationProvider);

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
          notificationTitle,
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.primaryColorLight),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '通知',
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: theme.primaryColorLight),
                ),
                Switch(
                  value: ref.watch(othersViewModelProvider).notification,
                  onChanged: (flag) {
                    ref
                        .read(othersViewModelProvider.notifier)
                        .setNotification(flag);
                  },
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  viewModel.showNotification(context);
                },
                child: const Text('通知送る'))
          ],
        ),
      ),
    );
  }
}
