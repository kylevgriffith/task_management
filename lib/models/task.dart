import 'package:get/get_rx/get_rx.dart';

class Task {
  final String title;
  final DateTime date;
  RxBool isDone;

  Task({
    required this.title,
    required this.date,
    required this.isDone,
  });
}

List<Task> tasksList = [
  Task(
      title: 'Meeting with design team',
      date: DateTime.now().add(const Duration(hours: 1)),
      isDone: RxBool(false)),
  Task(
      title: 'Check the business plan',
      date: DateTime.now().add(const Duration(hours: 2, minutes: 30)),
      isDone: RxBool(false)),
  Task(
      title: 'Coffee with Nick Rivera',
      date: DateTime.now().add(const Duration(hours: 5, minutes: 30)),
      isDone: RxBool(false)),
  Task(
      title: 'Help with Sam\'s project',
      date: DateTime.now().add(const Duration(hours: 6, minutes: 30)),
      isDone: RxBool(false)),
  Task(
      title: 'Desktop UI mockup design',
      date: DateTime.now().add(const Duration(hours: 8)),
      isDone: RxBool(false)),
];
