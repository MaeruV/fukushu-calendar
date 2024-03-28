import 'dart:io';

import 'package:ebbinghaus_forgetting_curve/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final othersNotificationProvider =
    Provider<OthersNotification>((ref) => OthersNotification());

class OthersNotification {
  Future<void> permission() async {
    if (Platform.isIOS) {
      var statusForNotification = await Permission.notification.status;

      if (statusForNotification != PermissionStatus.granted) {
        await openAppSettings();
      }
    }
  }

  Future<void> showNotification(BuildContext context) async {
    await permission();
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
    var localNotification = FlutterLocalNotificationsPlugin()
      ..initialize(initializationSettings);

    var androidDetails = const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
    );
    var iOSDetails = const DarwinNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);

    await localNotification.show(0, 'Notification Title', 'Notification Body',
        generalNotificationDetails);
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    debugPrint('id ----- $id');
  }
}
