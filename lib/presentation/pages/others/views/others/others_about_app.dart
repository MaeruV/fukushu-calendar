import 'package:ebbinghaus_forgetting_curve/presentation/component/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class OthersAboutApp extends ConsumerWidget {
  const OthersAboutApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.app_info,
        onBack: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: theme.highlightColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: const Column(
            children: <Widget>[
              OthersAboutAppTermsOfUse(),
              Divider(),
              OthersAboutAppPolicy(),
              Divider(),
              OthersLicenseInformation(),
            ],
          ),
        ),
      ),
    );
  }
}

class OthersAboutAppTermsOfUse extends ConsumerWidget {
  const OthersAboutAppTermsOfUse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () => context.push('/others_term_of_use'),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.text_snippet, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        appLocalizations.terms_of_use,
                        style: theme.textTheme.labelLarge!
                            .copyWith(color: theme.primaryColorLight),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.primaryColorLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OthersAboutAppPolicy extends ConsumerWidget {
  const OthersAboutAppPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () => context.push('/others_policy'),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.privacy_tip, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        appLocalizations.privacy_policy,
                        style: theme.textTheme.labelLarge!
                            .copyWith(color: theme.primaryColorLight),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.primaryColorLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OthersLicenseInformation extends ConsumerWidget {
  const OthersLicenseInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () async => context.push('/others_copyright'),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.copyright, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        appLocalizations.license_information,
                        style: theme.textTheme.labelLarge!
                            .copyWith(color: theme.primaryColorLight),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.primaryColorLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
