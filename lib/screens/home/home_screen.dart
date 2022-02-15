import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/helpers/contants.dart';
import 'package:task_management/helpers/extensions/date_extension.dart';
import 'package:task_management/screens/home/components/date_timeline.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              userInfoWidgets(),
              verticalSpace(),
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
              verticalSpace(),
              DateTimeline(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox verticalSpace() => SizedBox(height: Get.height * 0.04);

  Row userInfoWidgets() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.jpg'),
          radius: 30,
        ),
        SizedBox(width: Get.height * 0.02),
        const Text(
          'Hello, Alice Jordan!',
          style: kDefaultTextStyle,
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          iconSize: 30,
          onPressed: () {},
        ),
      ],
    );
  }
}
