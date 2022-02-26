import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/contants.dart';
import 'dates/date_widgets.dart';

class TopWidgets extends StatelessWidget {
  const TopWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          userInfoWidgets(),
          verticalSpace(),
          const DateWidgets(),
        ],
      ),
    );
  }
}

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

SizedBox verticalSpace() => SizedBox(height: Get.height * 0.03);
