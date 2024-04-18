import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/interval_tile_list.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntervalView extends ConsumerWidget {
  const IntervalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(intervalViewModelProvider);
    final appLocalizations = AppLocalizations.of(context)!;

    return ListView.builder(
      itemCount: state.length + 1,
      itemBuilder: (context, index) {
        return index < state.length
            ? IntervalTileList(index: index)
            : Center(
                child: Text(
                  appLocalizations.max_registration,
                  style: BrandText.bodyS.copyWith(color: BrandColor.grey),
                ),
              );
      },
    );
  }
}
