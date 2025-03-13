import 'package:ebbinghaus_forgetting_curve/domain/repository/admod_repository_interface.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/admod_db.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:isar/isar.dart';

class AdmodRepositoryImpl implements AdmodDBRepository {
  AdmodRepositoryImpl({
    required this.isar,
  });
  final Isar isar;

  @override
  Future<void> count({required int num, required DateTime now}) async {
    await isar.writeTxn(() async {
      final exists = await isar.admodDBs.where().findAll();
      AdmodDB admodDB;
      if (exists.isNotEmpty) {
        final admod = exists.first;
        final dateTime = exists.first.dateTime.toZeroHour();
        if (dateTime != now) {
          admodDB = admod
            ..num = 1
            ..dateTime = now;
        } else {
          admodDB = admod
            ..num = num + 1
            ..dateTime = now;
        }
      } else {
        admodDB = AdmodDB()
          ..num = 1
          ..dateTime = now;
      }
      await isar.admodDBs.put(admodDB);
    });
  }

  @override
  Future<AdmodDB?> fetchAll() async {
    final exists = await isar.admodDBs.where().findAll();
    if (exists.isNotEmpty) {
      return exists.first;
    } else {
      return null;
    }
  }
}
