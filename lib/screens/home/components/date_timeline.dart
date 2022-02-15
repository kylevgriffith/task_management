import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/screens/home/components/date_widget.dart';

class DateTimeline extends StatelessWidget {
  DateTimeline({Key? key}) : super(key: key);
  final DateTime startDate = DateTime.now();
  final int daysCount = 500;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.14,
      child: ListView.builder(
        itemCount: daysCount,
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemBuilder: (context, index) {
          DateTime date;
          DateTime _date = startDate.add(Duration(days: index));
          date = DateTime(_date.year, _date.month, _date.day);

          return DateWidget(
            date: date,
            isSelected: true,
          );
        },
      ),
    );
  }
}
