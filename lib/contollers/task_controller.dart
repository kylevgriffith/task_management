import 'package:get/state_manager.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  final RxList<Task> tasks;
  final RxList<Task> completedTasks;

  TaskController({required this.tasks, required this.completedTasks});

  void addTask(Task task) {
    tasks.addIf(isValidDate(task.date), task);
    sortByDate();
    update();
  }

  void addCompletedTask(Task task) {
    completedTasks.add(task);
    update();
  }

  bool isValidDate(DateTime date) {
    return date.isAfter(DateTime.now());
  }

  void removeTask(Task task) {
    tasks.remove(task);
    sortByDate();
    update();
  }

  void removeCompletedTask(Task task) {
    completedTasks.remove(task);
    update();
  }

  void toggleTask(Task task) {
    int index = tasks.indexOf(task);
    tasks[index].isDone = RxBool(!tasks[index].isDone.value);
    tasks[index].isDone.value
        ? addCompletedTask(task)
        : removeCompletedTask(task);
    update();
  }

  void toggleAll() {
    tasks.map((task) => task.isDone = RxBool(!task.isDone.value)).toList();
    update();
  }

  void clearCompleted() {
    tasks.removeWhere((value) => value.isDone.value);
    update();
  }

  void sortByDate() {
    tasks.sort((a, b) => a.date.compareTo(b.date));
    update();
  }

  int get remaining {
    return tasks.where((value) => !value.isDone.value).length;
  }

  int get completed {
    return tasks.where((value) => value.isDone.value).length;
  }

  bool get hasCompleted {
    return completed > 0;
  }

  bool get hasRemaining {
    return remaining > 0;
  }

  bool get allCompleted {
    return remaining == 0;
  }
}
