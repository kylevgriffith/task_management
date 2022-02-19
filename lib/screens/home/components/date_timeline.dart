import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/timeline_controller.dart';
import 'date_timeline_box.dart';

class DateTimeline extends StatelessWidget {
  DateTimeline({
    Key? key,
    required this.startDate,
    this.controller,
    this.onDateChange,
  }) : super(key: key);

  final DateTime startDate;
  final DatePickerController? controller;
  final DateTime initialSelectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  final void Function(DateTime)? onDateChange;
  final ScrollController _controller = ScrollController();

  late final DateTime _currentDate =
      initialSelectedDate.add(const Duration(days: 2));

  @override
  Widget build(BuildContext context) {
    final TimelineController controller = Get.put(
        TimelineController(dates: RxMap({}), currentDate: _currentDate));

    return SizedBox(
      height: Get.height * 0.15,
      child: ListView.builder(
        itemCount: 365,
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemBuilder: (context, index) {
          DateTime date = _getDate(index);
          bool isSelected = _isAtSameDate(date, _currentDate);

          controller.addDate(date, RxBool(isSelected));

          return Obx(
            () => DateTimelineBox(
              date: date,
              isSelected: controller.dates[date]!.value,
              onDateSelected: (selectedDate) {
                if (onDateChange != null) {
                  onDateChange!(selectedDate);
                }

                controller.changeSelectedDate(selectedDate);
              },
            ),
          );
        },
      ),
    );
  }

  DateTime _getDate(int index) {
    DateTime date;
    DateTime _date = startDate.add(Duration(days: index));
    date = DateTime(_date.year, _date.month, _date.day);
    return date;
  }

  bool _isAtSameDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }
}

class DatePickerController {}
