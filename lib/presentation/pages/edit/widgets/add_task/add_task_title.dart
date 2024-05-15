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

  static String _displayStringForOption(MaterialsHistory option) =>
      option.teachingMaterials;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(editViewModelProvider.notifier);
    final state = ref.watch(editViewModelProvider);
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
              Expanded(
                child: Autocomplete<MaterialsHistory>(
                  displayStringForOption: _displayStringForOption,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return value.where((MaterialsHistory option) {
                      return option.teachingMaterials
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    textEditingController.text = state.title;
                    return TextFormField(
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.primaryColorLight),
                      controller: textEditingController,
                      focusNode: focusNode,
                      enabled: true,
                      obscureText: false,
                      maxLines: 1,
                      onFieldSubmitted: (value) => notifier.setTitleText(value),
                      maxLength: 20,
                      cursorColor: BrandColor.blue,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        isDense: true,
                        hintText: appLocalizations.teaching_materials_content,
                        hintStyle:
                            BrandText.bodyS.copyWith(color: BrandColor.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: BrandColor.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: BrandColor.blue)),
                      ),
                    );
                  },
                  optionsViewBuilder: (BuildContext context,
                      void Function(MaterialsHistory) onSelected,
                      Iterable<MaterialsHistory> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 4.0,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 200),
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final MaterialsHistory option =
                                  options.elementAt(index);
                              return InkWell(
                                onTap: () => onSelected(option),
                                child: ListTile(
                                  title: Text(option.teachingMaterials,
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              color: theme.primaryColorLight),
                                      overflow: TextOverflow.ellipsis),
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: InkWell(
                                      onTap: () {
                                        ref
                                            .read(
                                                materialHistoryViewModelProvider
                                                    .notifier)
                                            .deleteMaterialHistory(option);
                                      },
                                      child: const Icon(Icons.highlight_remove,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  onSelected: (MaterialsHistory selection) {
                    notifier.setTitleText(selection.teachingMaterials);
                  },
                ),
              ),
            ],
          ),
        );
      default:
        return const CircularProgressIndicator();
    }
  }
}
