import 'dart:io';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timezone/timezone.dart' as tz;

part 'others_notification_view_model.g.dart';

@Riverpod(keepAlive: true)
class NotificationPermission extends _$NotificationPermission {
  @override
  bool build() {
    return false;
  }

  Future<void> permission() async {
    if (Platform.isIOS) {
      var statusForNotification = await Permission.notification.status;

      if (statusForNotification != PermissionStatus.granted) {
        state = false;
      } else {
        state = true;
      }
    }
  }

  Future<void> openSettings() async {
    await openAppSettings();
  }
}

@Riverpod(keepAlive: true)
class OthersNotifierModel extends _$OthersNotifierModel {
  final _localNotifications = FlutterLocalNotificationsPlugin();

  @override
  NotificationDetails? build() {
    return null;
  }

  Future<void> showNotification() async {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    var initializationSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    bool? isInitialized =
        await _localNotifications.initialize(initializationSettings);
    if (isInitialized == null || !isInitialized) {
      debugPrint('Notification initialization failed');
      return;
    }

    var androidDetails = const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
    );
    var iOSDetails = const DarwinNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);

    state = generalNotificationDetails;
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    debugPrint('id ----- $id');
  }

  Future<void> scheduleNotificationOnSpecificDate({
    required Map<DateTime, List<NotificationTask>> notificationTasks,
    required AppLocalizations appLocalizations,
  }) async {
    await cancelScheduleAll();
    notificationTasks.forEach((key, value) async {
      tz.TZDateTime scheduledDateTime = tz.TZDateTime.from(key, tz.local);

      tz.TZDateTime now = tz.TZDateTime.now(tz.local);

      if (scheduledDateTime.isBefore(now)) {
        debugPrint(
            '$scheduledDateTime Error: scheduledDateTime is in the past.');
        return;
      }
      for (final time in value) {
        final task = time.task.value;
        if (task != null) {
          final formatRange =
              "${task.firstRange} ${task.secoundRange != null ? "- ${task.secoundRange}" : ""} ${task.rangeType.stringToReviewRange().updateSelectionText(appLocalizations)}";
          await _localNotifications.zonedSchedule(
            time.id,
            time.task.value?.title,
            formatRange,
            scheduledDateTime,
            state!,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
          );
        }
      }
    });
  }

  cancelScheduleId(int notificationId) {
    _localNotifications.cancel(notificationId);
  }

  Future<void> cancelScheduleAll() async {
    await _localNotifications.cancelAll();
  }

  getScheduled() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await _localNotifications.pendingNotificationRequests();
    debugPrint('予約済みの通知');
    for (var pendingNotificationRequest in pendingNotificationRequests) {
      debugPrint(
          '予約済みの通知: [id: ${pendingNotificationRequest.id}, title: ${pendingNotificationRequest.title}, body: ${pendingNotificationRequest.body}, payload: ${pendingNotificationRequest.payload}]');
    }
  }

  Future<void> testNotification() async {
    _localNotifications.show(
      3,
      'タイトル',
      'Test1',
      state!,
    );
  }
}
