import 'package:flutter/material.dart';

class CheckTaskTitle extends StatelessWidget {
  const CheckTaskTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(title,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.primaryColorLight))),
        ],
      ),
    );
  }
}
