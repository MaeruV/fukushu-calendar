import 'package:ebbinghaus_forgetting_curve/application/state/home/home_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/modal_manager.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/widgets/bottom_custom_bar.dart';
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
    final ModalManager modal = ModalManager();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final top = MediaQuery.of(context).padding.top;
    final theme = Theme.of(context);
    final isLoading = useState(true);

    useEffect(() {
      Future(() async {
        ref
            .read(screenViewModelProvider.notifier)
            .setScreenSize(height, width, top);
        await ref.read(othersViewModelProvider.notifier).setOthers();
        isLoading.value = false;
      });
      return null;
    }, []);

    void _selectedIndex(int index) {
      notifier.onItemTapped(index);
    }

    void _actionButtonTapped() {
      ref.read(temporaryTaskProvider.notifier).state = null;
      modal.customShowModalSheet(context);
    }

    return Stack(
      children: [
        Scaffold(
          body: IndexedStack(
            index: state,
            children: notifier.screens!,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: theme.focusColor,
            onPressed: _actionButtonTapped,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: FABBottomAppBar(
            centerItemText: '',
            color: Colors.grey,
            selectedColor: BrandColor.blue,
            notchedShape: const CircularNotchedRectangle(),
            onTabSelected: _selectedIndex,
            items: [
              FABBottomAppBarItem(
                  iconData: Icons.calendar_month, text: 'カレンダー'),
              FABBottomAppBarItem(
                  iconData: Icons.edit_calendar_outlined, text: 'スケジュール'),
              FABBottomAppBarItem(iconData: Icons.check_box, text: '完了済み'),
              FABBottomAppBarItem(iconData: Icons.menu, text: 'メニュー'),
            ],
            backgroundColor: theme.canvasColor,
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
