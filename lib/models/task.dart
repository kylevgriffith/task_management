import 'package:flutter/material.dart';

import '../helpers/contants.dart';

class Task {
  final String title;
  final String? description;
  final DateTime date;
  final int progress;
  final Color color;

  Task({
    required this.title,
    required this.date,
    required this.progress,
    this.description,
    this.color = primaryColor,
  });
}

List<Task> tasksCardList = [
  Task(
      title: 'User interface design',
      date: DateTime.now().add(const Duration(days: 1)),
      progress: 72,
      color: primaryColor),
  Task(
      title: 'Wireframe elements',
      date: DateTime.now().add(const Duration(days: 4)),
      progress: 50,
      color: accentColor),
  Task(
      title: 'Landing website design',
      date: DateTime.now().add(const Duration(days: 7)),
      progress: 35,
      color: textColor),
  Task(
      title: 'Learn new technology',
      date: DateTime.now().add(const Duration(days: 8)),
      progress: 8,
      color: Colors.brown),
];
