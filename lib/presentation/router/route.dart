import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/check_task_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/views/interval_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/home_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/views/appearance/appearance_font_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/views/appearance/appearance_fonts_family_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/views/appearance/appearance_lang_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/views/others/others_copyright_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/views/others/others_help_site_page.dart';
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
      name: 'appearance_font_size',
      path: '/appearance_font_size',
      builder: (context, state) {
        return const AppearanceFontPage();
      },
    ),
    GoRoute(
      name: 'appearance_fonts_family',
      path: '/appearance_fonts_family',
      builder: (context, state) {
        return const AppearanceFontsFamilyPage();
      },
    ),
    GoRoute(
      name: 'appearance_lang',
      path: '/appearance_lang',
      builder: (context, state) {
        return const AppearancelangPage();
      },
    ),
    GoRoute(
      name: 'others_copyright',
      path: '/others_copyright',
      builder: (context, state) {
        return const OthersCopyrightPage();
      },
    ),
    GoRoute(
      name: 'others_help_site',
      path: '/others_help_site',
      builder: (context, state) {
        return const OthersHelpSitePage();
      },
    ),
  ],
);
