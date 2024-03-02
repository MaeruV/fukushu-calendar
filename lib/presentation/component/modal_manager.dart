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
                  children: List.generate(
                          100, (index) => _pickerItem((index + 1).toString()))
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _pickerItem(String str) {
    return Text(
      str,
      style: BrandText.titleM,
    );
  }

  void addShowMoodal(
    BuildContext context, {
    required double mediaHeight,
    required double safeAreaTop,
    required Widget child,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        // topのRadius.circularを0に設定することで、上部の角を無くす
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => SizedBox(
        height: mediaHeight - safeAreaTop,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: child,
        ),
      ),
    );
  }
}
