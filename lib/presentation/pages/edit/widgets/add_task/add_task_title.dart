import 'package:ebbinghaus_forgetting_curve/application/state/edit/color_picker_view_mode.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/material_history/material_history_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/matrial_history/state/material_history_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/history.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskTitle extends HookConsumerWidget {
  const AddTaskTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final config = ref.watch(fetchMaterialHistorysProvider);

    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        return SizedBox(
          height: 105,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appLocalizations.teaching_materials,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: theme.primaryColorLight),
              ),
              const SizedBox(height: 5),
              Expanded(child: AutocompleteWidget(value: value)),
            ],
          ),
        );
      default:
        return const CircularProgressIndicator();
    }
  }
}

class AutocompleteWidget extends ConsumerWidget {
  const AutocompleteWidget({super.key, required this.value});
  final List<MaterialsHistory> value;

  static String _displayStringForOption(MaterialsHistory option) =>
      option.teachingMaterials;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(editViewModelProvider.notifier);
    final colorNotifier = ref.read(colorPickerViewModelProvider.notifier);
    final state = ref.watch(editViewModelProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Autocomplete<MaterialsHistory>(
      initialValue: TextEditingValue(text: state.title),
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        return value.where((MaterialsHistory option) {
          return option.teachingMaterials
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (MaterialsHistory selection) {
        notifier.setMaterialHistory(selection);
        colorNotifier.addColorPicker(selection.pallete);
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextFormField(
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.primaryColorLight),
          controller: textEditingController,
          focusNode: focusNode,
          enabled: true,
          obscureText: false,
          maxLines: 1,
          onChanged: (value) => notifier.setTitleText(value),
          maxLength: 20,
          cursorColor: BrandColor.blue,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            isDense: true,
            hintText: appLocalizations.teaching_materials_content,
            hintStyle: BrandText.bodyS.copyWith(color: BrandColor.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: BrandColor.grey),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: BrandColor.blue)),
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                final MaterialsHistory option = options.elementAt(index);
                return ListTile(
                  title: Text(
                    option.teachingMaterials,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.primaryColorLight),
                  ),
                  onTap: () {
                    onSelected(option);
                  },
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(materialHistoryViewModelProvider.notifier)
                            .deleteMaterialHistory(option);
                      },
                      child: const Icon(Icons.highlight_remove,
                          color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
