import 'package:ebbinghaus_forgetting_curve/domain/entities/history.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/material_history_repository_interface.dart';
import 'package:isar/isar.dart';

class MaterialHistoryRepositoryImpl implements MaterialHistoryRepository {
  MaterialHistoryRepositoryImpl({required this.isar});
  final Isar isar;

  @override
  Future<void> add({required MaterialsHistory material}) async {
    await isar.writeTxn(() async {
      final count = await isar.materialsHistorys.count();
      if (count >= 20) {
        final oldestMaterial = await isar.materialsHistorys
            .where()
            .sortByRegistrationTime()
            .findFirst();
        if (oldestMaterial != null) {
          await isar.materialsHistorys.delete(oldestMaterial.id);
        }
      }

      // 新しいデータを追加
      final exists = await isar.materialsHistorys
          .filter()
          .teachingMaterialsEqualTo(material.teachingMaterials)
          .findFirst();
      if (exists == null) {
        await isar.materialsHistorys.put(material);
      } else {
        material.id = exists.id;
        await isar.materialsHistorys.put(material);
      }
    });
  }

  @override
  Future<List<MaterialsHistory>> fetchAll() async {
    final materialAll = await isar.materialsHistorys
        .where()
        .sortByRegistrationTimeDesc()
        .findAll();
    return materialAll;
  }

  @override
  Future<void> delete({required Id materialId}) async {
    await isar.writeTxn(() async {
      await isar.materialsHistorys.delete(materialId);
    });
  }
}
