import 'package:ebbinghaus_forgetting_curve/application/usecases/intervals/intervals.usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/intervals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'intervals_provider.g.dart';

@riverpod
Future<List<Intervals>> fetchIntervals(FetchIntervalsRef ref) async {
  return ref.watch(intervalsUsecaseProvider).fetchAllIntervals();
}

@riverpod
Future<Intervals?> fetchDefaultInterval(FetchDefaultIntervalRef ref) async {
  return ref.watch(intervalsUsecaseProvider).fetchDefaultInterval();
}
