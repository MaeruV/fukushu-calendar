import 'package:ebbinghaus_forgetting_curve/presentation/component/failure_snackbar.dart';
import 'package:flutter/material.dart';

/// プレゼンテーション層用のエラーハンドリングをラップした共通処理 Mixin
mixin PresentationMixin {
  Future<void> execute(
    BuildContext context, {
    required Future<void> Function() action,
    // required String successMessage,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      // SuccessSnackBar.show(
      //   scaffoldMessenger,
      //   message: successMessage,
      // );
    } catch (e) {
      String message = e.toString();
      if (message.startsWith('Exception: ')) {
        message = message.replaceFirst('Exception: ', '');
      }
      FailureSnackBar.show(
        scaffoldMessenger,
        message: message,
      );
    }
  }
}
