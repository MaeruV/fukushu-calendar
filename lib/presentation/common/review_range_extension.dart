import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ReviewRange {
  page,
  word,
  chapter,
}

extension ReviewRangeExtension on ReviewRange {
  String enumToString() {
    return toString().split('.').last;
  }

  String updateSelectionText(AppLocalizations appLocalizations) {
    switch (this) {
      case ReviewRange.page:
        return appLocalizations.page;
      case ReviewRange.word:
        return appLocalizations.word;
      case ReviewRange.chapter:
        return appLocalizations.chapter;
      default:
        return appLocalizations.page;
    }
  }
}

extension StringToReviewRangeExtension on String {
  ReviewRange stringToReviewRange() {
    switch (this) {
      case 'word':
        return ReviewRange.word;
      case 'chapter':
        return ReviewRange.chapter;
      default:
        return ReviewRange.page;
    }
  }
}
