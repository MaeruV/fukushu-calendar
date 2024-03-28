import 'package:ebbinghaus_forgetting_curve/application/state/home/home_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/widgets/bottom_navigation_bar.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/others/others_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final notifier = ref.read(homeViewModelProvider.notifier);
    final height = MediaQuery.of(context).size.height;
    final top = MediaQuery.of(context).padding.top;
    final isLoading = useState(true);

    useEffect(() {
      Future(() async {
        ref.read(screenViewModelProvider.notifier).setScreenSize(height, top);
        await ref.read(othersViewModelProvider.notifier).setOthers();
        isLoading.value = false;
      });
      return null;
    }, []);

    return Stack(
      children: [
        Scaffold(
          body: IndexedStack(
            index: state,
            children: notifier.screens!,
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: state,
            onTap: notifier.onItemTapped,
          ),
        ),
        IgnorePointer(
          ignoring: !isLoading.value,
          child: AnimatedOpacity(
            opacity: isLoading.value ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1000),
            child: Scaffold(
              body: Container(
                color: const Color(0xFF0A0E21),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
