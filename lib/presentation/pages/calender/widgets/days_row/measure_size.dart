import 'package:flutter/material.dart';

typedef void OnWidgetSizeChange(Size? size);

class MeasureSize extends StatefulWidget {
  final Widget child;
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required this.child,
  }) : super(key: key);

  @override
  _MeasureSizeState createState() => _MeasureSizeState();
}

class _MeasureSizeState extends State<MeasureSize> {
  Size? oldSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // ウィジェットのサイズが変更されたかどうかを確認
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (oldSize == null ||
              oldSize!.width != constraints.maxWidth ||
              oldSize!.height != constraints.maxHeight) {
            oldSize = Size(constraints.maxWidth, constraints.maxHeight);
            widget.onChange(oldSize);
          }
        });

        return Container(
          child: widget.child,
        );
      },
    );
  }
}
