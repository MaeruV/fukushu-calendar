import 'package:ebbinghaus_forgetting_curve/domain/entities/admod_db.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/history.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/others.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/admod_repository_interface.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/material_history_repository_interface.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/others_repository_interface.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/task_event_repository_interface.dart';
import 'package:ebbinghaus_forgetting_curve/infrastructure/admod/admod_repository_impl.dart';
import 'package:ebbinghaus_forgetting_curve/infrastructure/material_history/material_history_repository_impl.dart';
import 'package:ebbinghaus_forgetting_curve/infrastructure/others/repository/others_repository_impl.dart';
import 'package:ebbinghaus_forgetting_curve/infrastructure/task_event/repository/take_event_repository_impl.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await initializeIsar();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    return runApp(
      ProviderScope(
        overrides: [
          taskRepositoryProvider
              .overrideWithValue(TaskEventRepositoryImpl(isar: isar)),
          othersRepositoryProvider
              .overrideWithValue(OtherRepositoryImpl(isar: isar)),
          materialHistoryRepositoryProvider
              .overrideWithValue(MaterialHistoryRepositoryImpl(isar: isar)),
          admodRepositoryProvider
              .overrideWithValue(AdmodRepositoryImpl(isar: isar)),
        ],
        child: const App(),
      ),
    );
  });
}

Future<Isar> initializeIsar() async {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation("Asia/Tokyo"));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values);

  final dir = await getApplicationDocumentsDirectory();
  Isar isar = await Isar.open([
    TaskSchema,
    TaskDateSchema,
    OthersSchema,
    MaterialsHistorySchema,
    NotificationTaskSchema,
    AdmodDBSchema,
  ], directory: dir.path, inspector: true);
  return isar;
}
