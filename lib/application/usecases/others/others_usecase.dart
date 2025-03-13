import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/run_usecase_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/others.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/others_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final othersUsecaseProvider = Provider<OthersUsecase>(
  OthersUsecase.new,
);

class OthersUsecase with RunUsecaseMixin {
  OthersUsecase(this._ref);

  final Ref _ref;

  OthersRepository get _othersRepository => _ref.read(othersRepositoryProvider);
  StateController<bool> get _loadingController =>
      _ref.read(overlayLoadingProvider.notifier);

  Future<void> saveOthers({
    required String? currentTheme,
    required double? fontSize,
    required String? thickness,
    required String? textFamily,
    required String? language,
  }) async {
    Others others = Others()
      ..currentTheme = currentTheme ?? 'light'
      ..fontSize = fontSize ?? 13
      ..thickness = thickness ?? 'thin'
      ..textFamily = textFamily ?? 'Inter'
      ..language = language ?? 'ja';
    execute(
      loadingController: _loadingController,
      action: () async {
        await _othersRepository.add(others: others);
      },
    );
  }

  Future<void> updateOthers({
    required Others others,
    required String? currentTheme,
    required double? fontSize,
    required String? thickness,
    required String? textFamily,
    required String? language,
  }) async {
    others
      ..currentTheme = currentTheme ?? 'light'
      ..fontSize = fontSize ?? 13
      ..thickness = thickness ?? 'thin'
      ..textFamily = textFamily ?? 'Inter'
      ..language = language ?? 'ja';
    execute(
      loadingController: _loadingController,
      action: () async {
        await _othersRepository.update(others: others);
      },
    );
  }

  Future<Others?> fetchAll() async {
    // final others = await execute(
    //   action: () async {
    return await _othersRepository.fetchAll();
    // },
    //   loadingController: _loadingController,
    // );
    // return others;
  }
}
