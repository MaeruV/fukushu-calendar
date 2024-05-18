import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_picker_view_mode.g.dart';

@Riverpod(keepAlive: false)
class ColorPickerViewModel extends _$ColorPickerViewModel {
  late Task? task;

  @override
  List<int> build() {
    task = ref.watch(temporaryTaskProvider);
    final List<int> palletes = [if (task?.pallete != null) task!.pallete];

    return palletes;
  }

  Future<void> addColorPicker(int palette) async {
    if (!state.contains(palette)) {
      List<int> newState = [palette, ...state];
      if (newState.length > 5) {
        newState.removeAt(5);
      }
      state = newState;
    }
  }
}
