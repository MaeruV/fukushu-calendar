import 'package:ebbinghaus_forgetting_curve/presentation/component/failure_snackbar.dart';
import 'package:flutter/material.dart';

/// プレゼンテーション層用のエラーハンドリングをラップした共通処理 Mixin
mixin PresentationMixin {
  Future<void> execute(
    BuildContext context, {
    required Future<void> Function() action,
    required String failureMessage,
    required ScaffoldMessengerState scaffoldMessenger,
  }) async {
    try {
      await action();
    } catch (e) {
      if (failureMessage.isNotEmpty) {
        FailureSnackBar.show(
          scaffoldMessenger,
          message: failureMessage,
        );
      }
    }
  }

  Future<void> checkSnackBar({
    required Future<void> Function() action,
    required ScaffoldMessengerState scaffoldMessenger,
  }) async {
    scaffoldMessenger.removeCurrentSnackBar();
    action();
  }
}
