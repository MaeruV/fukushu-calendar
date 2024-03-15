import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

/// Post テーブルに関するリポジトリ
abstract interface class TaskRepository {
  /// タスク追加
  Future<void> add({required Task task, required List<int> intervalDays});

  /// タスク情報変更
  Future<void> update({required Task task, required List<int> intervalDays});

  /// タスク削除
  Future<void> delete({required Task task});

  /// タスク情報取得
  Future<Task?> fetch({required Id taskId});

  // タスクDate情報取得
  Future<TaskDate?> fetchDate({required Id dateId});

  /// タスク全取得
  Future<List<Task>> fetchAll();

  /// タスク件数取得
  Future<int> getCount();

  /// タスクDate追加
  Future<void> addTaskDate({required TaskDate taskDate, required bool flag});
}

/// 投稿リポジトリプロバイダー
/// アプリ起動時 or テスト時に本プロバイダーを override して使用してください
final taskRepositoryProvider = Provider<TaskRepository>(
  // 初期値を PostRepositoryImpl にしてしまうと、
  // ドメイン層がインフラ層に依存してしまうことになるので、
  // どの層にも依存させないために未実装エラーを返却するようにしておく
  (_) => throw UnimplementedError(),
);


// final taskEventRepositoryProvider =
//     Provider<TaskEventRepository>((ref) => TaskEventRepositoryImpl(ref));
