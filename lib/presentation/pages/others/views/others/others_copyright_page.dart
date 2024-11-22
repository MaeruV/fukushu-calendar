import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OthersCopyrightPage extends ConsumerWidget {
  const OthersCopyrightPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Theme(
        data: theme.copyWith(
            cardColor: theme.canvasColor,
            appBarTheme: theme.appBarTheme.copyWith(
              titleTextStyle: theme.textTheme.titleMedium,
              elevation: 1.5,
              backgroundColor: theme.canvasColor,
              foregroundColor: theme.primaryColorLight,
            )),
        child: const LicensePage(applicationName: '復習カレンダー'),
      ),
    );
  }
}
