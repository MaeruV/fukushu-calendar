extension DateExtension on int {
  Duration get daysDuration {
    return Duration(days: (this == 7) ? 0 : -this);
  }

  DateTime get visibleDateTime {
    final monthDif = this - 1200;
    final visibleYear = _visibleYear(monthDif);
    final visibleMonth = _visibleMonth(monthDif);
    return DateTime(visibleYear, visibleMonth);
  }

  int _visibleYear(int monthDif) {
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;
    final visibleMonth = currentMonth + monthDif;

    /// visibleMonthの表している月が
    /// 今年、もしくは来年以降の場合
    if (visibleMonth > 0) {
      return currentYear + (visibleMonth ~/ 12);

      /// visibleMonthが去年以前の場合
    } else {
      return currentYear + ((visibleMonth ~/ 12) - 1);
    }
  }

  int _visibleMonth(int monthDif) {
    final initialMonth = DateTime.now().month;
    final currentMonth = initialMonth + monthDif;

    /// visibleMonthの表している月が
    /// 今年、もしくは来年以降の場合
    if (currentMonth > 0) {
      return currentMonth % 12;

      /// visibleMonthが去年以前の場合
    } else {
      return 12 - (-currentMonth % 12);
    }
  }
}
