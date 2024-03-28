import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ユースケース実行のためのメソッドを備えた Mixin
///
/// 実行中に[OverlayLoading]を表示するためにloadingControllerを更新する
/// ローディング表示を別の箇所に任せたい場合（ie.FutureProvider)はnullにする
mixin RunUsecaseMixin {
  Future<T> execute<T>({
    StateController<bool>? loadingController,
    required Future<T> Function() action,
  }) async {
    final disableLoading = loadingController == null;

    if (disableLoading) {
      try {
        return await action();
      } catch (e) {
        print(e);
        rethrow;
      }
    }

    loadingController.update((_) => true);
    try {
      return await action();
    } catch (e) {
      rethrow;
    } finally {
      loadingController.update((_) => false);
    }
  }
}
