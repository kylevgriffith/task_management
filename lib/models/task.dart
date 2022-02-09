class Task {
  final String title;
  final String? description;
  final DateTime date;
  final int progress;

  Task({
    required this.title,
    required this.date,
    required this.progress,
    this.description,
  });
}

List<Task> tasksList = [
  Task(
      title: 'User interface design',
      date: DateTime.now().add(const Duration(days: 1)),
      progress: 75),
  Task(
      title: 'Wireframe elements',
      date: DateTime.now().add(const Duration(days: 4)),
      progress: 50),
  Task(
      title: 'Landing website design',
      date: DateTime.now().add(const Duration(days: 7)),
      progress: 35),
  Task(
      title: 'Learn new technology',
      date: DateTime.now().add(const Duration(days: 8)),
      progress: 8),
];
