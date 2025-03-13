import 'package:ebbinghaus_forgetting_curve/application/state/admod/rewarded_ad_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/material_history/material_history_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/admod/admod_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskSliverAppBar extends ConsumerStatefulWidget {
  const AddTaskSliverAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddTaskSliverAppBarState();
}

class _AddTaskSliverAppBarState extends ConsumerState<AddTaskSliverAppBar> {
  // final _consentManager = ConsentManager();
  // @override
  // void initState() {
  //   super.initState();
  //   _consentManager.gatherConsent((consentGatheringError) {
  //     if (consentGatheringError != null) {
  //       debugPrint(
  //           "${consentGatheringError.errorCode}: ${consentGatheringError.message}");
  //     }

  //     ref.read(rewardedAdViewModelProvider.notifier).initializeMobileAdsSDK();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editViewModelProvider);
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final admod = ref.watch(admodUsecaseProvider);
    final rewardedAd = ref.watch(rewardedAdViewModelProvider);

    String subject =
        state.hasTask ? appLocalizations.edit : appLocalizations.new_schedule;
    Color color = state.hasChanges ? BrandColor.deleteRed : BrandColor.grey;

    return SliverAppBar(
      floating: false,
      elevation: 4.0,
      pinned: true,
      expandedHeight: 50.0,
      centerTitle: true,
      leadingWidth: 100,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      leading: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Center(
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Text(
              appLocalizations.cancel,
              textAlign: TextAlign.start,
              style: BrandText.titleS.copyWith(color: BrandColor.blue),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(subject,
            style: theme.textTheme.titleSmall!
                .copyWith(color: theme.primaryColorLight)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () async {
              if (state.title.isNotEmpty) {
                _saveTaskAndHistory(context, appLocalizations, ref)
                    .then((value) {
                  context.pop();
                });
              }
              // final dateTime = DateTime.now().toZeroHour();
              // if (state.hasChanges) {
              //   admod.fetchAll().then((admodDb) {
              //     if (admodDb != null && admodDb.dateTime == dateTime) {
              //       if (admodDb.num >= 3) {
              //         DialogManager().adModCheckDialog(
              //           context: context,
              //           doneTap: () {
              //             rewardedAd?.show(onUserEarnedReward:
              //                 (AdWithoutView ad, RewardItem rewardItem) async {
              //               debugPrint('Reward amount: ${rewardItem.amount}');
              //               await _saveTaskAndHistory(
              //                       context, appLocalizations, ref)
              //                   .then((_) {
              //                 admod.countAdmod(num: admodDb.num);
              //                 context.pop();
              //                 context.pop();
              //               });
              //             });
              //           },
              //           cancelTap: () => context.pop(),
              //           titleTextStyle: theme.textTheme.titleMedium!
              //               .copyWith(color: theme.primaryColorLight),
              //           bodyTextStyle: theme.textTheme.bodySmall!
              //               .copyWith(color: BrandColor.grey),
              //           cancelTextStyle: theme.textTheme.bodyMedium!
              //               .copyWith(color: BrandColor.blue),
              //           doneTextStyle: theme.textTheme.bodyMedium!
              //               .copyWith(color: BrandColor.deleteRed),
              //         );
              //       } else {
              //         _saveTaskAndHistory(context, appLocalizations, ref)
              //             .then((value) {
              //           admod.countAdmod(num: admodDb.num);
              //           context.pop();
              //         });
              //       }
              //     } else {
              //       _saveTaskAndHistory(context, appLocalizations, ref)
              //           .then((value) {
              //         admod.countAdmod(num: 0);
              //         context.pop();
              //       });
              //     }
              //   });
              // }
            },
            child: Text(
              appLocalizations.complete,
              textAlign: TextAlign.right,
              style: BrandText.titleS.copyWith(color: color),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _saveTaskAndHistory(BuildContext context,
      AppLocalizations appLocalizations, WidgetRef ref) async {
    final state = ref.watch(editViewModelProvider);
    await ref.read(taskUsecaseProvider).saveTaskEvent(
          rangeType: state.reviewRange,
          firstRange: state.firstRange ?? 0,
          secoundRange: state.secoundRange,
          title: state.title,
          memo: state.memo,
          dateTime: state.startTime,
          intervalDays: state.intervalDays,
          pallete: state.pallete,
          time: state.time,
          flagNotification: state.flagNotification,
          eventCompDay: null,
          appLocalizations: appLocalizations,
        );
    await ref
        .read(materialHistoryViewModelProvider.notifier)
        .saveMaterialHistory(
          materialText: state.title,
          rangeType: state.reviewRange,
          firstRange: state.firstRange ?? 0,
          secoundRange: state.secoundRange,
          pallete: state.pallete,
          intervalDays: state.intervalDays,
          flagNotification: state.flagNotification,
          notificationTime: state.time,
        );
  }
}
