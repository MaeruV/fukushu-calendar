import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'others_view_model.g.dart';

final webViewCheckProvider = StateProvider<bool>((ref) => false);

@Riverpod(keepAlive: true)
class OthersViewModel extends _$OthersViewModel {
  late WebViewController webViewController;

  @override
  WebViewController? build() {
    return null;
  }

  initialize() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            ref.read(webViewCheckProvider.notifier).state = true;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://outgoing-soccer-654.notion.site/3d1aaa052c734645a7e33406a350316c?pvs=4'));
    state = webViewController;
  }
}
