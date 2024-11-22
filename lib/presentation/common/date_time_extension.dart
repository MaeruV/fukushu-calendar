import 'package:intl/intl.dart';

extension DateTimeJapaneseFormat on DateTime {
  String toSimpleFormat(String date) {
    switch (date) {
      case 'en_US':
        return DateFormat('EEEE, M/d/yyyy', date).format(this);
      case 'ja_JP':
        return DateFormat('yyyy年 MMMMd日 (E)', date).format(this);
      default:
        return DateFormat('yyyy年 MMMMd日 (E)', 'ja_JP').format(this);
    }
  }

  String toRelativeJapaneseFormat(String locale) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final targetDate = DateTime(year, month, day);

    if (targetDate == today) {
      return locale == 'en_US' ? 'Today' : '今日';
    } else if (targetDate == tomorrow) {
      return locale == 'en_US' ? 'Tommorow' : '明日';
    } else if (targetDate == yesterday) {
      return locale == 'en_US' ? 'Yesterday' : '昨日';
    } else {
      if (locale == 'en_US') {
        return DateFormat('MMMM d, yyyy', locale).format(this);
      } else {
        return '${targetDate.year}年${targetDate.month}月${targetDate.day}日';
      }
    }
  }

  bool isSameDayAs(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String toYMDFormat() {
    return DateFormat('yyyy/M/d').format(this);
  }

  String toMDFormat() {
    return DateFormat('M/d').format(this);
  }

  DateTime toZeroHour() {
    return DateTime(year, month, day, 0, 0, 0);
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String toHourMinute() {
    return DateFormat('HH:mm').format(this);
  }

  String toformatMonthYear(String date) {
    switch (date) {
      case 'en_US':
        return DateFormat('MMMM yyyy', date).format(this);
      case 'ja_JP':
        return DateFormat('yyyy年MMMM', date).format(this);
      default:
        return DateFormat('MMMM yyyy', 'en_US').format(this);
    }
  }

  String toYFormat(String date) {
    switch (date) {
      case 'en_US':
        return DateFormat('MMMM', date).format(this);

      case 'ja_JP':
        return DateFormat('MMMM', date).format(this);

      default:
        return DateFormat('MMMM', 'ja_JP').format(this);
    }
  }

  String toDFormat(String date) {
    switch (date) {
      case 'en_US':
        return DateFormat('d', date).format(this);

      case 'ja_JP':
        return DateFormat('d', date).format(this);

      default:
        return DateFormat('d', 'ja_JP').format(this);
    }
  }
}
