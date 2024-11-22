import 'package:ebbinghaus_forgetting_curve/domain/entities/admod_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Post テーブルに関するリポジトリ
abstract interface class AdmodDBRepository {
  /// タスク追加
  Future<void> count({required int num, required DateTime now});
  Future<AdmodDB?> fetchAll();
}

/// 投稿リポジトリプロバイダー
/// アプリ起動時 or テスト時に本プロバイダーを override して使用してください
final admodRepositoryProvider = Provider<AdmodDBRepository>(
  // 初期値を PostRepositoryImpl にしてしまうと、
  // ドメイン層がインフラ層に依存してしまうことになるので、
  // どの層にも依存させないために未実装エラーを返却するようにしておく
  (_) => throw UnimplementedError(),
);
