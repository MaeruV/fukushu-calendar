// カスタムフックの定義
import 'package:ebbinghaus_forgetting_curve/presentation/common/text_field_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AppTextEditingController useCustomTextEditingController(
    {required String text}) {
  return use(_HookTextFieldController(text));
}

class _HookTextFieldController extends Hook<AppTextEditingController> {
  final String text;
  const _HookTextFieldController(this.text);

  @override
  _HookTextFieldControllerState createState() =>
      _HookTextFieldControllerState();
}

class _HookTextFieldControllerState
    extends HookState<AppTextEditingController, _HookTextFieldController> {
  late final AppTextEditingController _controller;

  @override
  void initHook() {
    super.initHook();
    _controller = AppTextEditingController(text: hook.text);
  }

  @override
  void didUpdateHook(_HookTextFieldController oldHook) {
    super.didUpdateHook(oldHook);
  }

  @override
  AppTextEditingController build(BuildContext context) {
    return _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
