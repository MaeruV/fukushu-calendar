import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/widgets.dart';

class AppTextEditingController extends TextEditingController {
  AppTextEditingController({required String text}) : super(text: text);

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    assert(!value.composing.isValid ||
        !withComposing ||
        value.isComposingRangeValid);
    // If the composing range is out of range for the current text, ignore it to
    // preserve the tree integrity, otherwise in release mode a RangeError will
    // be thrown and this EditableText will be built with a broken subtree.
    final bool composingRegionOutOfRange =
        !value.isComposingRangeValid || !withComposing;

    if (composingRegionOutOfRange) {
      return TextSpan(style: style, text: text);
    }

    final TextStyle composingStyle = style?.merge(TextStyle(
            decoration: TextDecoration.none,
            background: Paint()
              ..color = BrandColor.black.withOpacity(0.1)
              ..style = PaintingStyle.fill
              ..strokeJoin = StrokeJoin.round)) ??
        TextStyle(
            decoration: TextDecoration.none,
            background: Paint()
              ..color = BrandColor.black.withOpacity(0.1)
              ..style = PaintingStyle.fill
              ..strokeJoin = StrokeJoin.round);

    return TextSpan(
      style: style,
      children: <TextSpan>[
        TextSpan(text: value.composing.textBefore(value.text)),
        TextSpan(
          style: composingStyle,
          text: value.composing.textInside(value.text),
        ),
        TextSpan(text: value.composing.textAfter(value.text)),
      ],
    );
  }
}
