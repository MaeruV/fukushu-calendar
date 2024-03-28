import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/run_usecase_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/others.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/others_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final othersUsecaseProvider = Provider<OthersUsecase>(
  OthersUsecase.new,
);

class OthersUsecase with RunUsecaseMixin {
  OthersUsecase(this._ref);

  final Ref _ref;

  OthersRepository get _othersRepository => _ref.read(othersRepositoryProvider);
  StateController<bool> get _loadingController =>
      _ref.read(overlayLoadingProvider.notifier);

  void saveOthers({
    required bool darkMode,
    required bool notification,
  }) {
    Others others = Others()
      ..darkMode = darkMode
      ..notification = notification;
    execute(
      loadingController: _loadingController,
      action: () async {
        await _othersRepository.add(others: others);
      },
    );
  }

  void updateOthers({
    required Others others,
    required bool darkMode,
    required bool notification,
  }) {
    others
      ..darkMode = darkMode
      ..notification = notification;
    execute(
      loadingController: _loadingController,
      action: () async {
        await _othersRepository.add(others: others);
      },
    );
  }

  Future<Others?> fetchAll() async {
    final others = await execute(
      action: () async {
        return await _othersRepository.fetchAll();
      },
      loadingController: _loadingController,
    );
    return others;
  }
}
