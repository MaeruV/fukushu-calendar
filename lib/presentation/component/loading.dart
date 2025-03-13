import 'package:flutter/material.dart';

class OverlayLoading extends StatelessWidget {
  const OverlayLoading({
    super.key,
    this.backgroundColor = Colors.black26,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ColoredBox(
        color: backgroundColor,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
