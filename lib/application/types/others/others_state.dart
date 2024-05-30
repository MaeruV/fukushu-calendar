import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'others_state.freezed.dart';

@freezed
class OthersState with _$OthersState {
  const factory OthersState({
    required WebViewController? helpSiteController,
    required WebViewController? termOfUseController,
    required WebViewController? policyController,
  }) = _OthersState;
}
