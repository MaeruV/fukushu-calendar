import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_picker_view_mode.g.dart';

@Riverpod(keepAlive: true)
class ColorPickerViewModel extends _$ColorPickerViewModel {
  @override
  List<int> build() {
    return [];
  }

  Future<void> addColorPicker(int palette) async {
    if (!state.contains(palette)) {
      List<int> newState = [palette, ...state];
      if (newState.length > 3) {
        newState.removeAt(3);
      }
      state = newState;
    }
  }
}
