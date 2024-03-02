import 'package:ebbinghaus_forgetting_curve/application/types/home/screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_view_model.g.dart';

@Riverpod(keepAlive: true)
class ScreenViewModel extends _$ScreenViewModel {
  @override
  ScreenState build() {
    return const ScreenState(
      mediaHeight: 0,
      safeAreaTop: 0,
    );
  }

  void setScreenSize(double height, double top) {
    state = state.copyWith(mediaHeight: height, safeAreaTop: top);
  }
}
