import 'package:ebbinghaus_forgetting_curve/domain/entities/others.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/others_repository_interface.dart';
import 'package:isar/isar.dart';

class OtherRepositoryImpl implements OthersRepository {
  OtherRepositoryImpl({required this.isar});
  final Isar isar;

  @override
  Future<void> add({required Others others}) async {
    await isar.writeTxn(() async {
      final existingData = await isar.others.where().findAll();
      if (existingData.isNotEmpty) {
        await isar.others.clear();
      }
      await isar.others.put(others);
    });
  }

  @override
  Future<Others?> fetchAll() async {
    final othersAll = await isar.others.where().findAll();
    if (othersAll.isNotEmpty) {
      return othersAll.first;
    } else {
      return null;
    }
  }

  @override
  Future<void> update({required Others others}) async {
    await isar.writeTxn(() async {
      await isar.others.put(others);
    });
  }
}
