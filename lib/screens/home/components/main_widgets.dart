import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../contollers/task_controller.dart';
import '../../../helpers/contants.dart';
import '../../../models/task.dart';
import 'tasks/task_list_widget.dart';

class MainWidgets extends StatelessWidget {
  const MainWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TweenAnimationBuilder(
        duration: kDefaultDuration,
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.bounceOut,
        builder: (context, double value, child) => Transform.translate(
          offset: Offset(0, (1 - value) * 200),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kDefaultRadius),
              topRight: Radius.circular(kDefaultRadius),
            ),
          ),
          child: taskTabs(),
        ),
      ),
    );
  }

  DefaultTabController taskTabs() {
    return DefaultTabController(
      length: 2,
      child: GetBuilder<TaskController>(
        init: TaskController(
            tasks: RxList(tasksList), completedTasks: RxList([])),
        builder: (controller) {
          return Column(
            children: [
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: accentColor,
                padding: const EdgeInsets.all(30),
                labelStyle: kTabsLabelTextStyle,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'All Tasks (${controller.tasks.length})',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Completed (${controller.completed})',
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    TaskListWidget(tasksList: controller.tasks),
                    TaskListWidget(tasksList: controller.completedTasks),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
