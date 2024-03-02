import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class DialogManager extends StatelessWidget {
  const DialogManager({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            context.pop();
          },
          child: const Text("OK"),
        )
      ],
    );
  }
}
