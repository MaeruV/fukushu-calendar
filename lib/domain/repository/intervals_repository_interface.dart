import 'package:ebbinghaus_forgetting_curve/domain/entities/intervals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

abstract interface class IntervalsRepository {
  Future<void> addInterval({required Intervals interval});

  Future<List<Intervals>> fetchAllIntervals();

  Future<void> deleteInterval({required Id intervalId});

  Future<Intervals?> fetchDefaultInterval();
}

final intervalsRepositoryProvider = Provider<IntervalsRepository>(
  (_) => throw UnimplementedError(),
);
