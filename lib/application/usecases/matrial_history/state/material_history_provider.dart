import 'package:ebbinghaus_forgetting_curve/application/usecases/matrial_history/material_history_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/history.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_history_provider.g.dart';

@riverpod
Future<List<MaterialsHistory>> fetchMaterialHistorys(
    FetchMaterialHistorysRef ref) async {
  return ref.watch(materilaHistoryUsecaseProvider).fetchAll();
}
