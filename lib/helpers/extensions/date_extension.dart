import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get justDate {
    return "$shortMonthName $day, $year";
  }

  String get shortMonthName {
    return DateFormat.MMM().format(this);
  }

  String get longMonthName {
    return DateFormat.MMMM().format(this);
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
