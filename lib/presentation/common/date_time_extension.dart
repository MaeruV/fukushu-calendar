import 'package:intl/intl.dart';

extension DateTimeJapaneseFormat on DateTime {
  String toJapaneseFormat() {
    return '${DateFormat.yMMMd('ja').format(this)}(${DateFormat.E('ja').format(this)})';
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
}
