import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.onBack});

  final String title;
  final Function()? onBack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return AppBar(
      elevation: 1.0,
      title: Text(title,
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.primaryColorLight)),
      leading: GestureDetector(
        onTap: onBack,
        child: Icon(
          Icons.chevron_left,
          color: theme.primaryColorLight,
          size: 35,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
