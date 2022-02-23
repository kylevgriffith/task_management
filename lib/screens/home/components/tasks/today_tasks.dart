import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../contollers/task_controller.dart';
import '../../../../helpers/contants.dart';
import '../../../../helpers/extensions/date_extension.dart';
import '../../../../models/task.dart';

class TodayTasks extends StatelessWidget {
  const TodayTasks({required this.tasks, Key? key}) : super(key: key);
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: tasksWdiget(),
      ),
    );
  }

  List<Widget> tasksWdiget() {
    return List.generate(
      tasks.length,
      (index) => taskWidget(tasks[index]),
    );
  }

  Column taskWidget(Task task) {
    return Column(
      children: [
        ListTile(
          leading: GestureDetector(
            onTap: () {
              Get.find<TaskController>().toggleTask(task);
            },
            child: Obx(
              () => checkIconWidget(task.isDone.value),
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

  Widget checkIconWidget(bool isDone) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeInOutBack,
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: Container(
        key: ValueKey(isDone),
        width: Get.width * 0.1,
        height: Get.width * 0.1,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDone
              ? primaryColor.withOpacity(0.2)
              : Colors.grey.withOpacity(0.2),
        ),
        child: SvgPicture.asset(
          'assets/icons/check.svg',
          color: isDone
              ? primaryColor.withOpacity(0.6)
              : Colors.grey.withOpacity(0.6),
        ),
      ),
    );
  }
}
