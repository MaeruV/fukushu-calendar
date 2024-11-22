import 'package:ebbinghaus_forgetting_curve/application/state/others/others_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OthersTermOfUseWidget extends ConsumerWidget {
  const OthersTermOfUseWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(othersViewModelProvider);
    final check = ref.watch(webViewCheckTermOfUseProvider);
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.terms_of_use,
        onBack: () => context.pop(),
      ),
      body: check
          ? WebViewWidget(
              controller: state.termOfUseController!,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
