import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/loading.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_floating_button.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_top_container.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_view.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditScreen extends HookConsumerWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(overlayLoadingProvider);

    return Scaffold(
      backgroundColor: BrandColor.background,
      body: Stack(
        children: [
          const SafeArea(
            child: Column(
              children: <Widget>[
                EditTopContainer(),
                Expanded(
                  child: EditView(),
                ),
              ],
            ),
          ),
          if (isLoading) const OverlayLoading(),
        ],
      ),
      floatingActionButton: const EditFloatingButton(),
    );
  }
}
