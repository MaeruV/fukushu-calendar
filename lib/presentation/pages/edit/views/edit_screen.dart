import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/loading.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/edit_widget/edit_add_task_button.dart';
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
      appBar: const EditTopContainer(),
      body: Stack(
        children: [
          const SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: EditView(),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 20,
            right: 20,
            child: EditAddTaskButton(),
          ),
          if (isLoading) const OverlayLoading(),
        ],
      ),
    );
  }
}
