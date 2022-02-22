import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../helpers/contants.dart';
import '../../../../helpers/extensions/date_extension.dart';

class DateTimelineBox extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final void Function(DateTime)? onDateSelected;

  const DateTimelineBox({
    Key? key,
    required this.date,
    required this.isSelected,
    this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedSwitcher(
        duration: kDefaultDuration,
        switchInCurve: Curves.easeInOut,
        child: Container(
          key: ValueKey(isSelected),
          width: Get.width * 0.16,
          margin: const EdgeInsets.only(right: 15.0),
          decoration: boxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: boxDateText(),
          ),
        ),
      ),
      onTap: () {
        if (onDateSelected != null) {
          onDateSelected!(date);
        }
      },
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(kDefaultRadius)),
      color: isSelected ? primaryColor : Colors.white,
      boxShadow: [
        if (isSelected)
          BoxShadow(
            color: primaryColor.withOpacity(0.4),
            offset: const Offset(5, 0),
            blurRadius: 10,
          ),
      ],
    );
  }

  Column boxDateText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          date.shortMonthName,
          style: kSmallDateTextStyle.copyWith(
            color: isSelected ? Colors.white : Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          date.day.toString(),
          style: kDefaultTextStyleBold.copyWith(
            color: isSelected ? Colors.white : Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          DateFormat.E().format(date).toUpperCase(),
          style: kSmallDateTextStyle.copyWith(
            color: isSelected ? Colors.white : Colors.black54,
          ),
        ),
      ],
    );
  }
}
