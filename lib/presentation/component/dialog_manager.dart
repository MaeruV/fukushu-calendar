import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogManager {
  setIntervalDialog({
    required String content,
    required BuildContext context,
  }) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return CupertinoAlertDialog(
      content: Text(
        content,
        style: TextStyle(color: theme.primaryColorLight),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            context.pop();
          },
          child: Text(appLocalizations.yes),
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

  adModCheckDialog({
    required BuildContext context,
    required Function()? cancelTap,
    required Function()? doneTap,
    required TextStyle titleTextStyle,
    required TextStyle bodyTextStyle,
    required TextStyle cancelTextStyle,
    required TextStyle doneTextStyle,
  }) {
    final appLocalizations = AppLocalizations.of(context)!;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(8),
            title: Text(
              appLocalizations.ad_viewing_offer,
              style: titleTextStyle,
            ),
            content: SizedBox(
              width: 400,
              child: Text(
                appLocalizations.ad_video_duration_notice,
              ),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: cancelTap,
                  child: Text(
                    appLocalizations.no,
                    style: cancelTextStyle,
                  )),
              const SizedBox(width: 20),
              GestureDetector(
                  onTap: doneTap,
                  child: Text(
                    appLocalizations.yes,
                    style: doneTextStyle,
                  )),
            ],
          );
        });
  }

  Future openAlertDialog({
    required BuildContext context,
    required AppLocalizations appLocalizations,
    required VoidCallback onDoneBtn,
  }) async {
    final theme = Theme.of(context);
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                appLocalizations.delete_confirmation,
                style: theme.textTheme.titleLarge!
                    .copyWith(color: theme.primaryColorLight),
              ),
              content: Text(
                appLocalizations.question_delete,
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: theme.primaryColorLight),
              ),
              actions: [
                GestureDetector(
                    onTap: () => context.pop(),
                    child: Text(
                      appLocalizations.no,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: BrandColor.blue),
                    )),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: onDoneBtn,
                    child: Text(
                      appLocalizations.yes,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: BrandColor.deleteRed),
                    )),
              ],
            ));
    // (6) ダイアログが閉じたときの結果
  }
}
