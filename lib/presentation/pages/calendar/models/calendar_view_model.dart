class CalendarViewModel {
  List<List<DateTime>> getMonths(DateTime dateTime) {
    List<List<DateTime>> weeks = [];
    DateTime monthStart = DateTime(dateTime.year, dateTime.month, 1);
    DateTime monthEnd = DateTime(dateTime.year, dateTime.month + 1, 1);

    int startWeekday = monthStart.weekday;
    DateTime firstCalendarDate = startWeekday == DateTime.sunday
        ? monthStart
        : monthStart.subtract(Duration(days: startWeekday));

    int endWeekday = monthEnd.weekday;
    DateTime lastCalendarDate = endWeekday == DateTime.saturday
        ? monthEnd
        : monthEnd.add(Duration(days: DateTime.saturday - endWeekday));

    for (DateTime d = firstCalendarDate;
        d.isBefore(lastCalendarDate.add(const Duration(days: 1)));
        d = d.add(const Duration(days: 1))) {
      if (weeks.isEmpty || weeks.last.length == 7) {
        weeks.add([]);
      }
      weeks.last.add(d);
    }

    return weeks;
  }
}
