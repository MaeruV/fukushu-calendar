import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OthersAppInfo extends ConsumerWidget {
  const OthersAppInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'アプリについて',
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.primaryColorLight),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: theme.highlightColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: const Column(
            children: <Widget>[
              OthersDetails(),
              Divider(),
              OthersHelp(),
              Divider(),
              OthersOpinion(),
            ],
          ),
        ),
      ],
    );
  }
}

class OthersDetails extends ConsumerWidget {
  const OthersDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  const Icon(Icons.info, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(
                    'アプリ詳細',
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: theme.primaryColorLight),
                  ),
                ],
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

class OthersHelp extends ConsumerWidget {
  const OthersHelp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  const Icon(Icons.help, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(
                    'ヘルプ・よくある質問',
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: theme.primaryColorLight),
                  ),
                ],
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

class OthersOpinion extends ConsumerWidget {
  const OthersOpinion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  const Icon(Icons.question_answer, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(
                    'ご意見・ご要望',
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: theme.primaryColorLight),
                  ),
                ],
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
