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
    return SizedBox(
      height: 100,
      child: BottomNavigationBar(
        backgroundColor: backgroundColor,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: Colors.white,
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
            label: 'Mapbox', // 非表示にしても、ラベルは必須です
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? BrandIcon.flagIcon(
                    const ColorFilter.mode(BrandColor.blue, BlendMode.srcIn),
                    1.1)
                : BrandIcon.flagIcon(
                    const ColorFilter.mode(BrandColor.grey, BlendMode.srcIn),
                    1.0),
            label: '検索', // 非表示にしても、ラベルは必須です
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
