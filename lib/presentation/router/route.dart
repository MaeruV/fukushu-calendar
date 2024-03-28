import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/check_task_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/interval_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/home_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/views/others_mode_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/views/others_notification_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  // extraCodec: const MyExtraCodec(),
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: 'interval',
      path: '/interval',
      builder: (context, state) => const IntervalScreen(),
    ),
    GoRoute(
      name: 'check_task',
      path: '/check_task',
      builder: (context, state) {
        return CheckTaskScreen(taskId: state.extra as int);
      },
    ),
    GoRoute(
      name: 'others_mode',
      path: '/others_mode',
      builder: (context, state) {
        return const OthersModeScreen();
      },
    ),
    GoRoute(
      name: 'others_notification',
      path: '/others_notification',
      builder: (context, state) {
        return const OthersNotificationScreen();
      },
    ),
  ],
);
