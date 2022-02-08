import 'contants.dart';

extension DateTimeExtension on DateTime {
  String get date {
    return "$day/$monthName/$year";
  }

  String get monthName {
    return months[month - 1];
  }

  String get leftTime {
    final now = DateTime.now();
    final diff = difference(now);
    final int days = diff.inDays;
    final int weeks = diff.inDays ~/ 7;
    final hours = diff.inHours;
    if (weeks > 0) {
      return "$weeks weeks";
    } else if (days > 0) {
      return "$days days";
    } else {
      return "$hours hours";
    }
  }
}
