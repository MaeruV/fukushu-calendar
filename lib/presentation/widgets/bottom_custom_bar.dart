import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconData, required this.text});
  IconData iconData;
  String text;
}

class FABBottomAppBar extends HookConsumerWidget {
  const FABBottomAppBar({
    super.key,
    required this.items,
    required this.centerItemText,
    this.height = 65.0,
    this.iconSize = 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
  });

  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedIndex = useState(0);

    updateIndex(int index) {
      if (index != 2) {
        onTabSelected(index);
        _selectedIndex.value = index;
      } else {
        onTabSelected(index);
      }
    }

    List<Widget> items = List.generate(this.items.length, (int index) {
      return _buildTabItem(
        item: this.items[index],
        index: index,
        onPressed: updateIndex,
        selectedIndex: _selectedIndex.value,
      );
    });

    return BottomAppBar(
      color: backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
    required int selectedIndex,
  }) {
    Color itemColor = selectedIndex == index ? selectedColor : color;
    if (index == 2) {
      return Expanded(
        child: Material(
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.grey),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.iconData,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: SizedBox(
          height: height,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => onPressed(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 40,
                      child: Icon(item.iconData,
                          color: itemColor, size: iconSize)),
                  Expanded(
                    child: Text(
                      item.text,
                      style: TextStyle(color: itemColor, fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
