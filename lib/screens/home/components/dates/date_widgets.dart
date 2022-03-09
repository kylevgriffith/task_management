import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/contants.dart';
import '../../../../helpers/extensions/date_extension.dart';
import 'date_timeline.dart';

class DateWidgets extends StatelessWidget {
  const DateWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateTime.now().justDate,
              style: kDefaultTextStyleBold,
            ),
            Container(
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultRadius),
                color: Colors.white,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.calendar_today,
                  color: primaryColor,
                ),
                title: Text(
                  DateTime.now().longMonthName,
                  style: kDefaultTextStyle,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.03),
        DateTimeline(
          startDate: DateTime.now(),
          selectedDate: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day + 2,
          ),
        ),
      ],
    );
  }
}
