import 'package:ebbinghaus_forgetting_curve/domain/entities/others.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract interface class OthersRepository {
  Future<void> add({required Others others});

  Future<void> update({required Others others});

  Future<Others?> fetchAll();
}

final othersRepositoryProvider = Provider<OthersRepository>(
  (_) => throw UnimplementedError(),
);
