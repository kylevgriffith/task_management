import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/extension.dart';

import '../../../../../utils/contants.dart';


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
          height: Get.height * 0.15,
          margin: const EdgeInsets.only(right: 15.0),
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.circular(kDefaultRadius)),
            color: isSelected ? primaryColor : Colors.white,
            boxShadow: boxShadow(isSelected),
          ),
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

  List<BoxShadow> boxShadow(bool usePrimaryColor) {
    return [
      const BoxShadow(
        color: Colors.white,
        offset: Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: usePrimaryColor
            ? primaryColor.withOpacity(0.4)
            : Colors.black.withOpacity(0.1),
        offset: const Offset(6.0, 6.0),
        blurRadius: 16.0,
      ),
    ];
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
          date.dayOfWeek,
          style: kSmallDateTextStyle.copyWith(
            color: isSelected ? Colors.white : Colors.black54,
          ),
        ),
      ],
    );
  }
}
