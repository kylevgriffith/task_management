import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/contants.dart';
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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.check_circle_outline,
            color: task.isDone ? primaryColor : Colors.grey,
          ),
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
