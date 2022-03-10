import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/contollers/task_controller.dart';
import '../../../../../core/models/task.dart';
import '../../../../../utils/contants.dart';
import '../../../../../utils/extension.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({required this.tasksList, Key? key}) : super(key: key);
  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: taskList(),
      ),
    );
  }

  List<Widget> taskList() {
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
            onTap: () {
              Get.find<TaskController>().toggleTask(task);
            },
            child: Obx(
              () => checkIconWidget(task.isDone.value),
            ),
          ),
          title: AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: task.isDone.value ? 0.2 : 1,
            child: Text(
              task.title,
            ),
          ),
          subtitle: AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: task.isDone.value ? 0.2 : 1,
            child: Text(
              task.date.leftTime,
            ),
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

  AnimatedSwitcher checkIconWidget(bool isDone) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
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
