import 'dart:ui';
import 'package:ebbinghaus_forgetting_curve/application/config/app_constants.dart';
import 'package:ebbinghaus_forgetting_curve/application/types/others/others_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'others_view_model.g.dart';

final webViewCheckHelpSiteProvider = StateProvider<bool>((ref) => false);
final webViewCheckTermOfUseProvider = StateProvider<bool>((ref) => false);
final webViewCheckPolicyProvider = StateProvider<bool>((ref) => false);

@Riverpod(keepAlive: true)
class OthersViewModel extends _$OthersViewModel {
  late WebViewController helpSiteController;
  late WebViewController termOfUseController;
  late WebViewController policyController;

  @override
  OthersState build() {
    return const OthersState(
      helpSiteController: null,
      termOfUseController: null,
      policyController: null,
    );
  }

  void initializeHelpSite() {
    helpSiteController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            ref.read(webViewCheckHelpSiteProvider.notifier).state = true;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(helpSiteUrl));

    termOfUseController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            ref.read(webViewCheckTermOfUseProvider.notifier).state = true;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(termOfUseUrl));

    policyController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            ref.read(webViewCheckPolicyProvider.notifier).state = true;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(policyUrl));

    state = state.copyWith(
        helpSiteController: helpSiteController,
        termOfUseController: termOfUseController,
        policyController: policyController);
  }
}
