import 'package:ebbinghaus_forgetting_curve/application/usecases/matrial_history/material_history_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/history.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_history_view_model.g.dart';

@Riverpod(keepAlive: true)
class MaterialHistoryViewModel extends _$MaterialHistoryViewModel {
  late MaterialHistoryUsecase _materialHistory;

  @override
  List<MaterialsHistory> build() {
    _materialHistory = ref.watch(materilaHistoryUsecaseProvider);
    return [];
  }

  Future<void> initialize() async {
    final materialHistory = await _fetchMaterialHistory();
    state = materialHistory;
  }

  Future<void> saveMaterialHistory({
    required String materialText,
    required ReviewRange rangeType,
    required int firstRange,
    required int? secoundRange,
    required int pallete,
    required List<int> intervalDays,
    required bool flagNotification,
    required DateTime? notificationTime,
  }) async {
    final formatRange = rangeType.enumToString();
    await _materialHistory.saveMaterialHisotry(
      materialText: materialText,
      rangeType: formatRange,
      firstRange: firstRange,
      secoundRange: secoundRange,
      pallete: pallete,
      intervalDays: intervalDays,
      flagNotification: flagNotification,
      notificationTime: notificationTime,
    );
  }

  Future<List<MaterialsHistory>> _fetchMaterialHistory() async {
    return await _materialHistory.fetchAll();
  }

  Future<void> deleteMaterialHistory(MaterialsHistory material) async {
    await _materialHistory.deleteMaterialHistory(material);
  }
}
