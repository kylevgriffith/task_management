import 'package:flutter/material.dart';
import '../../../helpers/extesnsion.dart';
import '../../../models/task.dart';
import '../../../helpers/contants.dart';

class TaskLists extends StatelessWidget {
  const TaskLists({required this.tasks, Key? key}) : super(key: key);
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          tasks.length,
          (index) => Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: taskBox(tasks[index]),
          ),
        ),
      ),
    );
  }

  Container taskBox(Task task) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: thirdColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: listTile(task),
    );
  }

  ListTile listTile(Task task) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: accentColor,
        radius: 30,
        child: Icon(
          Icons.format_list_bulleted,
        ),
      ),
      title: Text(
        task.title,
        style: kdefaultTextStyle.copyWith(
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        task.date.expandedDate,
      ),
      trailing: const Icon(
        Icons.more_vert,
        color: textColor,
      ),
    );
  }
}
