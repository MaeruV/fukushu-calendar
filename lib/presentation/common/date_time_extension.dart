import 'package:intl/intl.dart';

extension DateTimeJapaneseFormat on DateTime {
  String toSimpleFormat() {
    final year = DateFormat('y').format(this);
    final month = DateFormat('M').format(this);
    final day = DateFormat('d').format(this);
    final weekday = DateFormat('E', 'ja').format(this);
    return '$year/$month/$day ($weekday)';
  }

  String toJapaneseFormat() {
    final year = DateFormat('y').format(this);
    final month = DateFormat('M').format(this);
    final day = DateFormat('d').format(this);
    final weekday = DateFormat('E', 'ja').format(this);
    return '$year年$month月$day日 ($weekday)';
  }

  String toRelativeJapaneseFormat() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final targetDate = DateTime(year, month, day);

    if (targetDate == today) {
      return '今日から';
    } else if (targetDate == tomorrow) {
      return '明日から';
    } else if (targetDate == yesterday) {
      return '昨日から';
    } else {
      return '${targetDate.year}年${targetDate.month}月${targetDate.day}日から';
    }
  }

  DateTime toZeroHour() {
    return DateTime(year, month, day, 0, 0, 0);
  }
}
