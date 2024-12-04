import 'package:ebbinghaus_forgetting_curve/domain/entities/intervals.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/intervals_repository_interface.dart';
import 'package:isar/isar.dart';

class IntervalsRepositoryImpl implements IntervalsRepository {
  IntervalsRepositoryImpl({required this.isar});
  final Isar isar;

  @override
  Future<void> addInterval({required Intervals interval}) async {
    await isar.writeTxn(() async {
      await isar.intervals.put(interval);
    });
  }

  @override
  Future<void> deleteInterval({required Id intervalId}) async {
    if (intervalId == 1) {
      throw Exception("Cannot delete the default interval (ID: 1).");
    }
    await isar.writeTxn(() async {
      await isar.intervals.delete(intervalId);
    });
  }

  @override
  Future<List<Intervals>> fetchAllIntervals() async {
    final materialAll = await isar.intervals.where().findAll();
    return materialAll;
  }

  @override
  Future<Intervals?> fetchDefaultInterval() async {
    return await isar.intervals.filter().idEqualTo(1).findFirst();
  }
}
