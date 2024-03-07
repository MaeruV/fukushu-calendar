import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/add_task_modal_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  children:
                      List.generate(100, (index) => _pickerItem((index + 1)))
                          .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _pickerItem(int str) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$str日後',
          style: BrandText.bodyL,
        ),
        const SizedBox(width: 25),
        Text(
          DateTime.now().add(Duration(days: str)).toJapaneseFormat(),
          style: BrandText.bodyL,
        ),
      ],
    );
  }

  void customShowModalSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      isScrollControlled: true,
      context: context,
      builder: (ct) => AddTaskModalScreen(
        parentContext: ct,
      ),
    );
  }
}
