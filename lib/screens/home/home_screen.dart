import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/contants.dart';
import 'components/date_widgets.dart';

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
              const DateWidgets(),
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
