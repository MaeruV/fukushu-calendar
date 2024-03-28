import 'package:ebbinghaus_forgetting_curve/application/types/others/others_state.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/others/others_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'others_view_model.g.dart';

@riverpod
class OthersViewModel extends _$OthersViewModel {
  late OthersUsecase _others;

  @override
  OthersState build() {
    _others = ref.read(othersUsecaseProvider);

    return const OthersState(
      darkMode: false,
      notification: false,
    );
  }

  Future<void> setOthers() async {
    final others = await _others.fetchAll();
    if (others != null) {
      state = state.copyWith(
        darkMode: others.darkMode,
        notification: others.notification,
      );
    }
  }

  void setDarkMode(bool darkMode) {
    state = state.copyWith(darkMode: darkMode);
    ref.read(othersUsecaseProvider).saveOthers(
          darkMode: darkMode,
          notification: state.notification,
        );
  }

  void setNotification(bool notification) {
    state = state.copyWith(notification: notification);

    ref.read(othersUsecaseProvider).saveOthers(
          darkMode: state.darkMode,
          notification: notification,
        );
  }
}
