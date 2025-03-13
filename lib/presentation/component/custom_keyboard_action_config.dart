import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class CustomKeyboardActionConfig extends ConsumerWidget {
  const CustomKeyboardActionConfig({
    super.key,
    required this.child,
    required this.focusNode,
  });
  final Widget child;
  final FocusNode focusNode;

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    final theme = Theme.of(context);

    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: theme.canvasColor,
      nextFocus: false,
      actions: [
        KeyboardActionsItem(
          focusNode: focusNode,
          toolbarAlignment: MainAxisAlignment.end,
          displayArrows: false,
          toolbarButtons: [
            (node) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => node.unfocus(),
                      child: Text(
                        "完了",
                        style: theme.textTheme.titleSmall!
                            .copyWith(color: theme.primaryColorLight),
                      ),
                    ),
                  ],
                ),
              );
            }
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KeyboardActions(
      config: _buildConfig(context),
      child: child,
    );
  }
}
