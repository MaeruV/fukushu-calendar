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

    return Column(
      children: [
        const SizedBox(height: 16),
        const DropdownButtonMenu(),
        Expanded(
          child: ListView.builder(
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
          ),
        ),
      ],
    );
  }
}

class DropdownButtonMenu extends StatefulWidget {
  const DropdownButtonMenu({Key? key}) : super(key: key);

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  Map<String, List<int>> intervals = {
    'default': [1, 2],
    '1': [3, 5, 7, 30],
    '2': [7, 10, 14, 21, 30],
    '3': [7, 10, 17, 21, 30, 60],
    '4': [7, 10, 14, 21, 30, 46, 60, 70, 100, 120, 150],
  };

  String? selectedInterval = 'default';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DropdownMenu<String>(
        width: double.infinity,
        label: const Text('復讐間隔'),
        initialSelection: selectedInterval,
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          constraints: BoxConstraints.tight(const Size.fromHeight(50)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: BrandColor.grey),
          ),
        ),
        textStyle: const TextStyle(fontSize: 16),
        onSelected: (String? interval) {
          setState(() {
            selectedInterval = interval;
          });
        },
        dropdownMenuEntries: intervals.entries.map((entry) {
          return DropdownMenuEntry<String>(
            value: entry.key,
            label: _formatInterval(entry.value),
            style: MenuItemButton.styleFrom(
              textStyle: const TextStyle(fontSize: 14.0),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _formatInterval(List<int> interval) {
    return '${interval.join(", ")}日後';
  }
}
