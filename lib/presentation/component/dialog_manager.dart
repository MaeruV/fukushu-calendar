import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogManager {
  setIntervalDialog({required String content, required BuildContext context}) {
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

  showColorPicker({
    required BuildContext context,
    required Color selectColor,
    required TextStyle textStyle,
    required String hedingText,
    required String subheadingText,
    required String doneText,
    required Function(Color) onColorChanged,
    required VoidCallback doneBtn,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            elevation: 5,
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ColorPicker(
                        color: selectColor,
                        onColorChanged: onColorChanged,
                        width: 44,
                        height: 44,
                        borderRadius: 22,
                        heading: Text(
                          hedingText,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        subheading: Text(
                          subheadingText,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      TextButton(
                          onPressed: doneBtn,
                          child: Text(
                            doneText,
                            style: textStyle,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
