import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/task_event_repository_interface.dart';
import 'package:ebbinghaus_forgetting_curve/infrastructure/task_event/repository/take_event_repository_impl.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Isar isar =
      await Isar.open([TaskSchema], directory: dir.path, inspector: true);

  return runApp(
    ProviderScope(
      overrides: [
        taskRepositoryProvider
            .overrideWithValue(TaskEventRepositoryImpl(isar: isar)),
      ],
      child: const App(),
    ),
  );
}
