import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/contollers/task_controller.dart';
import 'package:task_management/models/task.dart';

import '../../helpers/contants.dart';
import 'components/tasks/today_tasks.dart';

class MainWidgets extends StatelessWidget {
  const MainWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kDefaultRadius),
            topRight: Radius.circular(kDefaultRadius),
          ),
        ),
        child: tabs(),
      ),
    );
  }

  Widget tabs() {
    return DefaultTabController(
      length: 2,
      child: GetBuilder<TaskController>(
        init: TaskController(tasks: RxList(tasksList)),
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
                      'Today\'s Tasks (${controller.tasks.length})',
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
                    TodayTasks(
                      tasks: controller.tasks,
                    ),
                    const SizedBox(),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
