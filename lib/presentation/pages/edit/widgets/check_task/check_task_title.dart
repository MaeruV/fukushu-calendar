import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';

class CheckTaskTitle extends StatelessWidget {
  const CheckTaskTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Text(
          title,
          style: BrandText.bodyL,
        )),
      ],
    );
  }
}
