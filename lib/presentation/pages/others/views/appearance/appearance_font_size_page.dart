import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/event_labels.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/measure_size.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/table_calendar_page_.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/others/widgets/appearance/appearance_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppearanceFontSizePage extends ConsumerWidget {
  const AppearanceFontSizePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(
            Icons.chevron_left,
            size: 35,
            color: theme.primaryColorLight,
          ),
        ),
        title: Text(
          '文字の大きさ',
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.primaryColorLight),
        ),
      ),
      body: const Column(
        children: <Widget>[
          SizedBox(height: 30),
          AppearanceTableCell(),
          SizedBox(height: 30),
          AppearamceFontSizeContainer(),
        ],
      ),
    );
  }
}

class AppearanceTableCell extends HookConsumerWidget {
  const AppearanceTableCell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final size = ref.watch(screenViewModelProvider);
    final tableSize = size.mediaHeight * 0.8;
    print('Appearance: $tableSize');
    final width = size.mediaWidth / 7;
    final height = tableSize / 6;
    const minHeight = dayLabelHeight + 14;
    final heightFactor = useState(1.0);
    const maxHeightFactor = 1.0;
    final collapsed = ref.read(appearamceCollapsedProvider.notifier);
    final double minHeightFactor = minHeight / height;

    void _onVerticalDragUpdate(DragUpdateDetails details) {
      final newHeightFactor =
          (heightFactor.value + details.primaryDelta! / height)
              .clamp(minHeightFactor, maxHeightFactor);
      heightFactor.value = newHeightFactor;
    }

    void _onVerticalDragEnd(DragEndDetails details) {
      if (heightFactor.value < 0.6) {
        heightFactor.value = minHeightFactor;
        collapsed.state = true;
      } else {
        heightFactor.value = maxHeightFactor;
        collapsed.state = false;
      }
    }

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onVerticalDragUpdate: _onVerticalDragUpdate,
          onVerticalDragEnd: _onVerticalDragEnd,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height * heightFactor.value,
                  decoration: BoxDecoration(
                      color: theme.canvasColor,
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: const AppearanceCell(),
                ),
                Container(
                  height: 25,
                  width: width,
                  decoration: BoxDecoration(
                    color: theme.canvasColor,
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 5,
                          width: 30,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppearanceCell extends ConsumerWidget {
  const AppearanceCell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          height: dayLabelContentHeight.toDouble(),
          margin:
              EdgeInsets.symmetric(vertical: dayLabelVerticalMargin.toDouble()),
          child: Text('28',
              style: theme.textTheme.bodySmall!.copyWith(color: Colors.red)),
        ),
        Expanded(
          child: MeasureSize(
              onChange: (Size? size) {
                final notifier = ref.read(cellHeightProvider.notifier);
                notifier.state = size!.height;
              },
              child: AppearanceEventLabels(
                date: DateTime.now().add(const Duration(days: 2)),
                events: [
                  CalendarEvent(
                    eventName: '英単語1-101',
                    eventDate: DateTime.now().add(const Duration(days: 2)),
                    eventBackgroundColor: Colors.amber,
                    eventID: 0,
                    taskDate: null,
                  ),
                ],
              )),
        )
      ],
    );
  }
}

class AppearamceFontSizeContainer extends ConsumerWidget {
  const AppearamceFontSizeContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      decoration: BoxDecoration(
          color: theme.highlightColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: const Column(
        children: <Widget>[],
      ),
    );
  }
}
