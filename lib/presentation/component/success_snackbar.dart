import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

/// 処理成功用スナックバー
class SuccessSnackBar extends SnackBar {
  SuccessSnackBar._({required String message})
      : super(
          content: Row(
            children: [
              const Icon(
                Icons.check,
                color: BrandColor.blue,
              ),
              Text(
                message,
                style: const TextStyle(color: BrandColor.blue),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 4.0,
          backgroundColor: Colors.white,
          closeIconColor: BrandColor.blue,
          clipBehavior: Clip.hardEdge,
          dismissDirection: DismissDirection.horizontal,
        );

  static void show(
    ScaffoldMessengerState scaffoldMessenger, {
    required String message,
  }) {
    scaffoldMessenger.showSnackBar(SuccessSnackBar._(message: message));
  }
}
