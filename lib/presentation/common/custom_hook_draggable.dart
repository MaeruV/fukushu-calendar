import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/* Widget から呼ぶ関数 */

DraggableScrollableController useDraggableController() =>
    use(const _DraggableController());

/* どうしても必要なコントローラー */
class _DraggableController extends Hook<DraggableScrollableController> {
  const _DraggableController();

  @override
  _DraggableControllerState createState() => _DraggableControllerState();
}

/* カスタムHook */

class _DraggableControllerState
    extends HookState<DraggableScrollableController, _DraggableController> {
  late final DraggableScrollableController _controller;
  @override
  void initHook() {
    super.initHook();
    _controller = DraggableScrollableController();
  }

  @override
  void didUpdateHook(_DraggableController oldHook) {
    super.didUpdateHook(oldHook);
    if (hook.keys == null) {}
  }

  @override
  DraggableScrollableController build(BuildContext context) {
    return _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
