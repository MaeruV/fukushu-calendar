import 'package:ebbinghaus_forgetting_curve/application/state/edit/interval_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/custom_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/modal_manager.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class AppearanceIntervalPage extends ConsumerStatefulWidget {
  const AppearanceIntervalPage({super.key});

  @override
  AppearanceIntervalPageState createState() => AppearanceIntervalPageState();
}

class AppearanceIntervalPageState
    extends ConsumerState<AppearanceIntervalPage> {
  @override
  void initState() {
    super.initState();
    ref.read(intervalViewModelProvider.notifier).fetchDefaultInterval();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.interval_default,
        onBack: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          context.pop();
        },
      ),
      body: const _AppearanceInterval(),
      floatingActionButton: const _DefaultIntervalFloatingBtn(),
    );
  }
}

class _AppearanceInterval extends ConsumerWidget {
  const _AppearanceInterval();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final state = ref.watch(intervalViewModelProvider);
    final theme = Theme.of(context);

    return state.selectInterval == null
        ? const SizedBox.shrink()
        : Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            child: ListView.builder(
              itemCount: state.selectInterval!.nums.length + 1,
              itemBuilder: (context, index) {
                return index < state.selectInterval!.nums.length
                    ? _DefaultIntervalList(
                        index: index,
                        intervalId: state.selectInterval!.id,
                      )
                    : Center(
                        child: Text(appLocalizations.max_registration,
                            style: TextStyle(
                                fontSize: 16, color: theme.primaryColorLight)),
                      );
              },
            ),
          );
  }
}

class _DefaultIntervalList extends ConsumerWidget {
  final int index;
  final int intervalId;

  const _DefaultIntervalList({
    required this.intervalId,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(intervalViewModelProvider);
    final dateTime = DateTime.now().toLocal().copyWith(
        hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: SizedBox(
          width: 100,
          child: Text(
            '${state.selectInterval!.nums[index]} ${appLocalizations.days_after}',
            style: theme.textTheme.bodySmall!
                .copyWith(color: theme.primaryColorLight),
            textAlign: TextAlign.center,
          ),
        ),
        title: Text(
          dateTime
              .add(Duration(days: state.selectInterval!.nums[index]))
              .toSimpleFormat(appLocalizations.date),
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.primaryColorLight),
          textAlign: TextAlign.end,
        ),
        trailing:
            _DefaultIntervalCancelBtn(index: state.selectInterval!.nums[index]),
      ),
    );
  }
}

class _DefaultIntervalFloatingBtn extends ConsumerWidget {
  const _DefaultIntervalFloatingBtn();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(intervalViewModelProvider.notifier);
    final ModalManager modalManager = ModalManager();
    final appLocalizations = AppLocalizations.of(context)!;

    int selectedValue = 1;

    return FloatingActionButton(
      onPressed: () {
        modalManager.showModalPicker(
          context: context,
          cancelTap: () => context.pop(),
          doneTap: (ctx) {
            context.pop();
            notifier.setNumber(
              num: selectedValue,
              context: ctx,
              sameNumContent: appLocalizations.same_num_content,
              maxLengthContent: appLocalizations.max_length_content,
            );
          },
          selectedTap: (ctx) {
            context.pop();
            notifier.setNumber(
              num: selectedValue,
              context: ctx,
              sameNumContent: appLocalizations.same_num_content,
              maxLengthContent: appLocalizations.max_length_content,
            );
          },
          onSelectedItemChanged: (index) {
            selectedValue = index + 1;
          },
        );
      },
      backgroundColor: BrandColor.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Icon(
        Icons.add,
        color: BrandColor.white,
      ),
    );
  }
}

class _DefaultIntervalCancelBtn extends ConsumerWidget {
  const _DefaultIntervalCancelBtn({required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(intervalViewModelProvider.notifier);
    final state = ref.watch(intervalViewModelProvider);
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        if (state.selectInterval!.nums.length > 1) {
          notifier.deleteNumber(index);
        } else {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  appLocalizations.please_select_at_least_one,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: BrandColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: BrandColor.deleteRed,
                behavior: SnackBarBehavior.fixed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                duration: const Duration(seconds: 3),
              ),
            );
        }
      },
      child: const Icon(
        Icons.cancel_outlined,
        color: BrandColor.deleteRed,
        size: 20,
      ),
    );
  }
}
