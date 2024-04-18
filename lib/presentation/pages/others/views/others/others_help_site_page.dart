import 'package:ebbinghaus_forgetting_curve/application/state/others/others_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OthersHelpSitePage extends HookConsumerWidget {
  const OthersHelpSitePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(othersViewModelProvider);
    final check = ref.watch(webViewCheckProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: "ヘルプ・よくある質問",
        onBack: () => context.pop(),
      ),
      body: check
          ? WebViewWidget(
              controller: state!,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
