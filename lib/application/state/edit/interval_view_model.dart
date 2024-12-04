import 'package:collection/collection.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/types/edit/edit_interval_state.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/intervals/intervals.usecase.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/intervals/state/intervals_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/intervals.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/dialog_manager.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'interval_view_model.g.dart';

@Riverpod(keepAlive: false)
class IntervalViewModel extends _$IntervalViewModel {
  late DialogManager dialogManager;

  @override
  EditIntervalState build() {
    dialogManager = DialogManager();

    return const EditIntervalState(
      selectInterval: null,
      intervalDays: [],
    );
  }

  void fetchDefaultInterval() async {
    final intervals = await ref.read(fetchIntervalsProvider.future);
    final existingInterval = intervals.firstWhereOrNull((interval) {
      return interval.id == 1;
    });

    state = state.copyWith(
      selectInterval: existingInterval,
      intervalDays: intervals,
    );
  }

  void initializeInteval() async {
    final intervals = await ref.read(fetchIntervalsProvider.future);

    final editState = ref.read(editViewModelProvider);

    final nullIntervals = Intervals()..nums = editState.intervalDays;

    final existingInterval = intervals.firstWhereOrNull((interval) {
      return listEquals(interval.nums, editState.intervalDays);
    });

    if (existingInterval != null) {
      state = state.copyWith(
        selectInterval: existingInterval,
        intervalDays: intervals,
      );
    } else {
      ref.read(intervalsUsecaseProvider).addInterval(interval: nullIntervals);
      intervals.add(nullIntervals);
      state = state.copyWith(
        selectInterval: nullIntervals,
        intervalDays: intervals,
      );
    }
  }

  void selectInterval(int? intervalId) {
    final interval = state.intervalDays.firstWhereOrNull((entry) {
      return entry.id == intervalId;
    });

    state = state.copyWith(selectInterval: interval);
  }

  void setNumber({
    required int num,
    required BuildContext context,
    required String sameNumContent,
    required String maxLengthContent,
  }) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (state.selectInterval == null) {
      if (state.intervalDays.length < 20) {
        _createNewInterval(num);
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                appLocalizations.max_registration_20,
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
    } else {
      _updateExistingInterval(num, context, sameNumContent, maxLengthContent);
    }
  }

  void _createNewInterval(int num) {
    final newInterval = Intervals()..nums = [num];
    final updatedIntervalDays = List<Intervals>.from(state.intervalDays)
      ..add(newInterval);

    ref.read(intervalsUsecaseProvider).addInterval(interval: newInterval);

    state = state.copyWith(
      selectInterval: newInterval,
      intervalDays: updatedIntervalDays,
    );
  }

  void _updateExistingInterval(int num, BuildContext context,
      String sameNumContent, String maxLengthContent) {
    List<int> selectInterval = state.selectInterval!.nums.toList();

    if (selectInterval.contains(num)) {
      _showDialog(context, sameNumContent);
      return;
    }

    if (selectInterval.length > 9) {
      _showDialog(context, maxLengthContent);
      return;
    }

    List<int> updatedSelectInterval = List<int>.from(selectInterval)
      ..add(num)
      ..sort();

    final updatedIntervalDays = List<Intervals>.from(state.intervalDays);
    final index = updatedIntervalDays.indexWhere(
      (interval) => interval.id == state.selectInterval!.id,
    );

    if (index != -1) {
      updatedIntervalDays[index] = state.selectInterval!
        ..nums = updatedSelectInterval;
    } else {
      updatedIntervalDays.add(Intervals()..nums = updatedSelectInterval);
    }

    final updatedSelectIntervalObj = state.selectInterval!
      ..nums = updatedSelectInterval;
    ref
        .read(intervalsUsecaseProvider)
        .addInterval(interval: updatedSelectIntervalObj);

    state = state.copyWith(
      selectInterval: updatedSelectIntervalObj,
      intervalDays: updatedIntervalDays,
    );
  }

  void _showDialog(BuildContext context, String content) {
    showDialog(
      context: context,
      builder: (context) => dialogManager.setIntervalDialog(
        content: content,
        context: context,
      ),
    );
  }

  void deleteNumber(int numberToRemove) {
    if (state.selectInterval == null) {
      return;
    }

    final currentInterval = List<int>.from(state.selectInterval!.nums);
    if (!currentInterval.contains(numberToRemove)) return;
    currentInterval.remove(numberToRemove);

    final updatedIntervalDays = List<Intervals>.from(state.intervalDays);
    final index = updatedIntervalDays.indexWhere(
      (interval) => interval.id == state.selectInterval!.id,
    );

    final updatedSelectInterval = state.selectInterval!..nums = currentInterval;

    if (index != -1) {
      if (currentInterval.isEmpty) {
        updatedIntervalDays.removeAt(index);
        ref
            .read(intervalsUsecaseProvider)
            .deleteIntervals(intervalId: updatedSelectInterval.id);
        state = state.copyWith(
          selectInterval: null,
          intervalDays: updatedIntervalDays,
        );
      } else {
        updatedIntervalDays[index].nums = currentInterval;
        ref
            .read(intervalsUsecaseProvider)
            .addInterval(interval: updatedSelectInterval);
        state = state.copyWith(
          selectInterval: updatedSelectInterval,
          intervalDays: updatedIntervalDays,
        );
      }
    }
  }
}
