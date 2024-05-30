import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/run_usecase_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/admod_db.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/admod_repository_interface.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final admodUsecaseProvider = Provider<AdmodUsecase>(
  AdmodUsecase.new,
);

@riverpod
class AdmodUsecase with RunUsecaseMixin {
  AdmodUsecase(this._ref);

  final Ref _ref;

  AdmodDBRepository get _admodRepository => _ref.read(admodRepositoryProvider);
  StateController<bool> get _loadingController =>
      _ref.read(overlayLoadingProvider.notifier);

  Future<void> countAdmod({
    required int num,
  }) async {
    final dateTime = DateTime.now().add(const Duration(days: 0)).toZeroHour();
    execute(
      loadingController: _loadingController,
      action: () async {
        await _admodRepository.count(num: num, now: dateTime);
      },
    );
  }

  Future<AdmodDB?> fetchAll() async {
    return await _admodRepository.fetchAll();
  }
}
