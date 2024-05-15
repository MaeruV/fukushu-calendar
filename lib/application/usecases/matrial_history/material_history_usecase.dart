import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/matrial_history/state/material_history_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/run_usecase_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/history.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/material_history_repository_interface.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final materilaHistoryUsecaseProvider = Provider<MaterialHistoryUsecase>(
  MaterialHistoryUsecase.new,
);

@riverpod
class MaterialHistoryUsecase with RunUsecaseMixin {
  MaterialHistoryUsecase(this._ref);

  final Ref _ref;

  MaterialHistoryRepository get _materialHistoryRepository =>
      _ref.read(materialHistoryRepositoryProvider);
  StateController<bool> get _loadingController =>
      _ref.read(overlayLoadingProvider.notifier);
  void _refreshMaterialHistoryProvider() =>
      _ref.refresh(fetchMaterialHistorysProvider.future);

  Future<void> saveMaterialHisotry({
    required String materialText,
  }) async {
    MaterialsHistory materialHistory = MaterialsHistory()
      ..teachingMaterials = materialText
      ..registrationTime = DateTime.now();
    execute(
      loadingController: _loadingController,
      action: () async {
        await _materialHistoryRepository.add(material: materialHistory);
      },
    );
  }

  Future<List<MaterialsHistory>> fetchAll() async {
    return await _materialHistoryRepository.fetchAll();
  }

  Future<void> deleteMaterialHistory(MaterialsHistory material) async {
    await _materialHistoryRepository.delete(materialId: material.id);
    _refreshMaterialHistoryProvider();
  }
}
