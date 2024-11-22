import 'package:ebbinghaus_forgetting_curve/domain/entities/history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

abstract interface class MaterialHistoryRepository {
  Future<void> add({required MaterialsHistory material});

  Future<List<MaterialsHistory>> fetchAll();

  Future<void> delete({required Id materialId});
}

final materialHistoryRepositoryProvider = Provider<MaterialHistoryRepository>(
  (_) => throw UnimplementedError(),
);
