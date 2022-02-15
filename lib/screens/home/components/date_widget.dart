import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_management/helpers/contants.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({required this.date, required this.isSelected, Key? key})
      : super(key: key);

  final DateTime date;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      margin: const EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(kDefaultRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: kDefaultTextStyleBold.copyWith(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Text(
              DateFormat.E().format(date),
              style: kDefaultTextStyleBold.copyWith(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
