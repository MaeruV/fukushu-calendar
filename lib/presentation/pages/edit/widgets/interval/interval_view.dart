import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/types/edit/edit_interval_state.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/intervals.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/interval/interval_tile_list.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class IntervalView extends ConsumerWidget {
  const IntervalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(intervalViewModelProvider);
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      children: [
        const SizedBox(height: 16),
        const DropdownButtonMenu(),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: state.selectInterval == null
                ? 1
                : state.selectInterval!.nums.length + 1,
            itemBuilder: (context, index) {
              if (state.selectInterval == null) {
                return Center(
                  child: Text(
                    appLocalizations.max_registration,
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: theme.primaryColorLight),
                  ),
                );
              }
              return index < state.selectInterval!.nums.length
                  ? IntervalTileList(
                      index: index,
                      intervalId: state.selectInterval!.id,
                    )
                  : state.selectInterval!.id == 1
                      ? Center(
                          child: TextButton(
                            onPressed: () =>
                                context.push('/appearance_interval'),
                            child: Text(appLocalizations.change_the_defalut,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: BrandColor.blue,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        )
                      : Center(
                          child: Text(
                            appLocalizations.max_registration,
                            style: theme.textTheme.labelLarge!
                                .copyWith(color: theme.primaryColorLight),
                          ),
                        );
            },
          ),
        ),
      ],
    );
  }
}

class DropdownButtonMenu extends ConsumerWidget {
  const DropdownButtonMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(intervalViewModelProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: dropdownButton2(state, ref, context),
      ),
    );
  }

  Widget dropdownButton2(
      EditIntervalState state, WidgetRef ref, BuildContext context) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<int?>(
        value: state.selectInterval != null &&
                state.intervalDays
                    .any((entry) => entry.id == state.selectInterval!.id)
            ? state.selectInterval!.id
            : null,
        onChanged: (int? id) {
          ref.read(intervalViewModelProvider.notifier).selectInterval(id);
        },
        items: [
          ...state.intervalDays.map<DropdownMenuItem<int>>((entry) {
            return DropdownMenuItem<int>(
              value: entry.id,
              child: Text(
                _formatInterval(entry, context),
                style: TextStyle(
                  fontWeight:
                      entry.id == 1 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
          DropdownMenuItem<int?>(
            value: null,
            child: Text(
              appLocalizations.new_registration,
              style: const TextStyle(color: BrandColor.blue),
            ),
          ),
        ],
        underline: const SizedBox.shrink(),
        isExpanded: true,
        style: TextStyle(
          fontSize: 18,
          color: theme.primaryColorLight,
          fontWeight: FontWeight.normal,
        ),
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            color: theme.highlightColor,
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 1,
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: theme.primaryColorLight,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: theme.highlightColor,
            borderRadius: BorderRadius.circular(14),
          ),
          offset: const Offset(0, -5),
          elevation: 1,
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all(6),
            thumbVisibility: WidgetStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 5, right: 5),
        ),
      ),
    );
  }

  String _formatInterval(Intervals interval, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final formattedIntervals =
        interval.nums.map((interval) => '$interval').join(', ');
    return '$formattedIntervals${appLocalizations.days_after}';
  }
}
