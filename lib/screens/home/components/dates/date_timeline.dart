import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../contollers/timeline_controller.dart';
import '../../../../helpers/contants.dart';
import 'date_timeline_box.dart';

class DateTimeline extends StatelessWidget {
  DateTimeline({
    Key? key,
    required this.startDate,
    required this.selectedDate,
    this.daysCount = 365,
    this.onDateChange,
  }) : super(key: key);

  final int daysCount;
  final DateTime startDate;
  final void Function(DateTime)? onDateChange;
  final ScrollController _controller = ScrollController();
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    final TimelineController controller = Get.put(
        TimelineController(dates: RxMap({}), currentDate: selectedDate));

    return SizedBox(
      height: Get.height * 0.15,
      child: TweenAnimationBuilder(
        duration: kDefaultDuration,
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.easeIn,
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: child,
          );
        },
        child: ListView.builder(
          itemCount: daysCount,
          scrollDirection: Axis.horizontal,
          controller: _controller,
          itemBuilder: (context, index) {
            DateTime date = _getDate(index);
            bool isSelected = _isAtSameDate(date, selectedDate);

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
                  _scrollToDate(controller.selectedDateIndex);
                },
              ),
            );
          },
        ),
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

  void _scrollToDate(int index) {
    _controller.animateTo(
      index * (Get.width * 0.16 + 15),
      duration: kDefaultDuration,
      curve: Curves.easeInOut,
    );
  }
}
