import 'package:flutter/material.dart';

import '../../helpers/contants.dart';
import '../../helpers/extesnsion.dart';
import '../../models/task.dart';

class TaskCards extends StatelessWidget {
  const TaskCards({required this.tasks, Key? key}) : super(key: key);

  final List<Task> tasks;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          tasksList.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: taskCard(size, tasks[index]),
          ),
        ),
      ),
    );
  }

  Container taskCard(Size size, Task task) {
    return Container(
      height: size.height * 0.25,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: cardColor(task.progress),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leftTaskTime(task.date),
            taskTitle(task.title),
            taskProgress(task.progress),
          ],
        ),
      ),
    );
  }

  Widget taskProgress(int progress) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Progress',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
            Text(
              progress.toString() + '%',
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ],
        ),
        LinearProgressIndicator(
          value: progress / 100,
          backgroundColor: Colors.grey,
          valueColor: const AlwaysStoppedAnimation(Colors.white),
        ),
      ],
    );
  }

  Align taskTitle(String title) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }

  Align leftTaskTime(DateTime date) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        date.leftTime + ' left',
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }

  Color cardColor(int progress) {
    double opacity = progressColor(progress);
    return accentColor.withOpacity(opacity);
  }

  double progressColor(int progress) => progress < 40 ? 0.35 : progress / 100;
}
