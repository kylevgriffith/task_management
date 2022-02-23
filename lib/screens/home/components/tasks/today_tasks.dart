import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_management/helpers/contants.dart';

import '../../../../helpers/extensions/date_extension.dart';
import '../../../../models/task.dart';

class TodayTasks extends StatelessWidget {
  const TodayTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: tasks(),
      ),
    );
  }
}

List<Widget> tasks() {
  return List.generate(
    tasksList.length,
    (index) => taskWidget(tasksList[index]),
  );
}

Column taskWidget(Task task) {
  return Column(
    children: [
      ListTile(
        leading: GestureDetector(
          onTap: () {},
          child: checkIconWidget(task.isDone),
        ),
        title: Text(
          task.title,
        ),
        subtitle: Text(
          task.date.leftTime,
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: Get.width * 0.8,
          child: const Divider(
            thickness: 1,
          ),
        ),
      ),
    ],
  );
}

Widget checkIconWidget(bool isDone) {
  return Container(
    width: Get.width * 0.1,
    height: Get.width * 0.1,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color:
          isDone ? primaryColor.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
    ),
    child: SvgPicture.asset(
      'assets/icons/check.svg',
      color:
          isDone ? primaryColor.withOpacity(0.6) : Colors.grey.withOpacity(0.6),
    ),
  );
}
