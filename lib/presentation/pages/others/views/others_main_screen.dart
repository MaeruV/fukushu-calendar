import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/widgets/others_app_info.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/widgets/others_%20appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OthersMainScreen extends HookConsumerWidget {
  const OthersMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 1.5,
        centerTitle: true,
        title: Text(appLocalizations.menu,
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.primaryColorLight)),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: <Widget>[
              OthersAppearance(),
              SizedBox(height: 30),
              OthersAppInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
