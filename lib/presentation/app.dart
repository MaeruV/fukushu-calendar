import 'package:ebbinghaus_forgetting_curve/application/state/others/others_notification_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/theme/custom_theme.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/router/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulHookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    ref.read(notificationPermissionProvider.notifier).permission();
    ref.read(othersNotifierModelProvider.notifier).showNotification();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      ref.read(notificationPermissionProvider.notifier).permission();
      ref.read(othersNotifierModelProvider.notifier).showNotification();
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final themeState = ref.watch(customThemeProvider);
    final config = ref.watch(themeInitProvider);

    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData():
        return MaterialApp.router(
          locale: Locale(themeState.language),
          debugShowCheckedModeBanner: false,
          theme: themeState.currentAppTheme(),
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ja'),
            Locale('ko'),
          ],
        );
      default:
        return const CircularProgressIndicator();
    }
  }
}
