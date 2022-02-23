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
    return isToday ? time : dayOfWeek;
  }

  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  String get dayOfWeek {
    return DateFormat.E().format(this).toUpperCase();
  }

  String get time {
    return DateFormat.jm().format(this);
  }
}
