import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/others/others_notification_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskNotification extends ConsumerWidget {
  const AddTaskNotification({super.key});

  Future<TimeOfDay?> showDate(BuildContext context, DateTime time) async {
    final theme = Theme.of(context);
    TimeOfDay timeOfDay = TimeOfDay(hour: time.hour, minute: time.minute);
    final TimeOfDay? datePicked = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: Theme.of(context).copyWith(
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              timePickerTheme: theme.timePickerTheme,
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  foregroundColor:
                      WidgetStateColor.resolveWith((states) => Colors.blue),
                  overlayColor:
                      WidgetStateColor.resolveWith((states) => Colors.blue),
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );
    return datePicked;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editViewModelProvider);
    final notifier = ref.read(editViewModelProvider.notifier);
    final theme = Theme.of(context);
    final now = DateTime.now().toZeroHour();
    final appLocalizations = AppLocalizations.of(context)!;
    final notificaitonState = ref.watch(notificationPermissionProvider);

    return GestureDetector(
      onTap: () async {
        final now = DateTime.now().toZeroHour();
        final datePicked = await showDate(context, state.time ?? now);
        if (datePicked != null) {
          DateTime time = DateTime(
              now.year, now.month, now.day, datePicked.hour, datePicked.minute);
          if (time != state.time) {
            notifier.setTime(time);
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocalizations.notification,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.primaryColorLight),
                ),
                notificaitonState
                    ? Switch(
                        activeColor: theme.primaryColorLight,
                        value: state.flagNotification,
                        onChanged: (flag) async {
                          ref
                              .read(editViewModelProvider.notifier)
                              .setNotificationFlag(flag);
                        },
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
          notificaitonState
              ? state.flagNotification
                  ? Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: BrandColor.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            state.time?.toHourMinute() ?? now.toHourMinute(),
                            style: BrandText.bodyS,
                          ),
                          const Icon(
                            Icons.timelapse,
                            color: BrandColor.grey,
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink()
              : GestureDetector(
                  onTap: () async {
                    await ref
                        .read(notificationPermissionProvider.notifier)
                        .openSettings();
                  },
                  child: Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      leading: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.notification_important,
                              color: BrandColor.deleteRed),
                        ],
                      ),
                      trailing: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chevron_right),
                        ],
                      ),
                      title: Text(
                        appLocalizations.notification_permission,
                        style: theme.textTheme.titleSmall!
                            .copyWith(color: BrandColor.deleteRed),
                      ),
                      subtitle: Text(
                        appLocalizations.notification_permission_content,
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: theme.primaryColorLight),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
