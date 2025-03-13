import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/intervals/state/intervals_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/run_usecase_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/intervals.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/intervals_repository_interface.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final intervalsUsecaseProvider = Provider<IntervalsUsecase>(
  IntervalsUsecase.new,
);

@riverpod
class IntervalsUsecase with RunUsecaseMixin {
  IntervalsUsecase(this._ref);

  final Ref _ref;

  IntervalsRepository get _intervalsRepository =>
      _ref.read(intervalsRepositoryProvider);
  StateController<bool> get _loadingController =>
      _ref.read(overlayLoadingProvider.notifier);
  void _refreshIntervalsProvider() =>
      _ref.refresh(fetchIntervalsProvider.future);
  void _refreshDefaultIntervalsProvider() =>
      _ref.refresh(fetchDefaultIntervalProvider.future);

  Future<void> addInterval({
    required Intervals interval,
  }) async {
    execute(
      loadingController: _loadingController,
      action: () async {
        await _intervalsRepository.addInterval(interval: interval);
        _refreshDefaultIntervalsProvider();
      },
    );
  }

  Future<List<Intervals>> fetchAllIntervals() async {
    final intervals = await _intervalsRepository.fetchAllIntervals();
    return intervals;
  }

  Future<Intervals?> fetchDefaultInterval() async {
    return await _intervalsRepository.fetchDefaultInterval();
  }

  Future<void> deleteIntervals({required int intervalId}) async {
    await _intervalsRepository.deleteInterval(intervalId: intervalId);
    _refreshIntervalsProvider();
  }
}
