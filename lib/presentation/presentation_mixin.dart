import 'package:ebbinghaus_forgetting_curve/presentation/component/failure_snackbar.dart';
import 'package:flutter/material.dart';

/// プレゼンテーション層用のエラーハンドリングをラップした共通処理 Mixin
mixin PresentationMixin {
  Future<void> execute(
    BuildContext context, {
    required Future<void> Function() action,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      // SuccessSnackBar.show(
      //   scaffoldMessenger,
      //   message: successMessage,
      // );
    } catch (e) {
      print(e.toString());
      FailureSnackBar.show(
        scaffoldMessenger,
        message: e.toString(),
      );
    }
  }
}
