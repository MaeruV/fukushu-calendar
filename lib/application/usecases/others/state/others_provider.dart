import 'package:ebbinghaus_forgetting_curve/application/usecases/others/others_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/others.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'others_provider.g.dart';

@riverpod
Future<Others?> others(OthersRef ref) async {
  return ref.watch(othersUsecaseProvider).fetchAll();
}
