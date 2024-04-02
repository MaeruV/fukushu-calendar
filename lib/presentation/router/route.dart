import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/check_task_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/interval_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/home_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/views/others_copyright_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/views/others_setting_screen.dart';
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
      name: 'others_setting',
      path: '/others_setting',
      builder: (context, state) {
        return const OthersSettingScreen();
      },
    ),
    GoRoute(
      name: 'others_copyright',
      path: '/others_copyright',
      builder: (context, state) {
        return const OthersCopyrightScreen();
      },
    ),
  ],
);
