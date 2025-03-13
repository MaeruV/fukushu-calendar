import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/icons.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Color backgroundColor;
  final Color selectedItemColor;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.backgroundColor,
    required this.selectedItemColor,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 100,
      child: BottomNavigationBar(
        backgroundColor: backgroundColor,
        selectedItemColor: theme.focusColor,
        unselectedItemColor: theme.primaryColorLight,
        currentIndex: currentIndex,
        onTap: onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? BrandIcon.calenderIcon(
                    const ColorFilter.mode(BrandColor.blue, BlendMode.srcIn),
                    1.1)
                : BrandIcon.calenderIcon(
                    const ColorFilter.mode(BrandColor.grey, BlendMode.srcIn),
                    1.0),
            label: 'カレンダー', // 非表示にしても、ラベルは必須です
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? BrandIcon.editIcon(
                    const ColorFilter.mode(BrandColor.blue, BlendMode.srcIn),
                    1.1)
                : BrandIcon.editIcon(
                    const ColorFilter.mode(BrandColor.grey, BlendMode.srcIn),
                    1.0),
            label: 'スケジュール', // 非表示にしても、ラベルは必須です
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? BrandIcon.flagIcon(
                    const ColorFilter.mode(BrandColor.blue, BlendMode.srcIn),
                    1.1)
                : BrandIcon.flagIcon(
                    const ColorFilter.mode(BrandColor.grey, BlendMode.srcIn),
                    1.0),
            label: '完了済み', // 非表示にしても、ラベルは必須です
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? const Icon(
                    Icons.menu,
                    size: 25,
                    color: BrandColor.blue,
                  )
                : const Icon(
                    Icons.menu,
                    size: 25,
                    color: BrandColor.grey,
                  ),
            label: 'メニュー',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
