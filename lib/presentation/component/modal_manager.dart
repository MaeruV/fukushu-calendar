import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/add_task_modal_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ModalManager {
  void showModalPicker(
      {required BuildContext context,
      required VoidCallback cancelTap,
      required Function(BuildContext) doneTap,
      required Function(BuildContext) selectedTap,
      required Function(int)? onSelectedItemChanged}) {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: cancelTap,
                  child: Text(
                    'キャンセル',
                    style: BrandText.bodyM.copyWith(color: BrandColor.blue),
                  ),
                ),
                TextButton(
                  onPressed: () => doneTap(context),
                  child: Text(
                    '完了',
                    style:
                        BrandText.bodyL.copyWith(color: BrandColor.deleteRed),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: GestureDetector(
                onTap: () => selectedTap(context),
                child: CupertinoPicker(
                  itemExtent: 30,
                  onSelectedItemChanged: onSelectedItemChanged,
                  children: List.generate(
                      100,
                      (index) => _pickerItem(
                            (index + 1),
                            context,
                          )).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _pickerItem(int str, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    TextStyle style =
        theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorLight);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Changed to start alignment
      children: [
        const SizedBox(width: 25),
        Text(
          '$str ${appLocalizations.days_after}',
          style: style,
          textAlign: TextAlign.start,
        ),
        const SizedBox(width: 20),
        Text(
          DateTime.now()
              .add(Duration(days: str))
              .toSimpleFormat(appLocalizations.date),
          style: style,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }

  void customShowModalSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      builder: (ct) => AddTaskModalScreen(parentContext: ct),
    );
  }
}
