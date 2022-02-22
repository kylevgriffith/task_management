class Task {
  final String title;
  final DateTime date;
  final bool isDone;

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
      isDone: true),
  Task(
      title: 'Check the business plan',
      date: DateTime.now().add(const Duration(hours: 2, minutes: 30)),
      isDone: true),
  Task(
      title: 'Coffee with Nick Rivera',
      date: DateTime.now().add(const Duration(hours: 5, minutes: 30)),
      isDone: false),
  Task(
      title: 'Help with Sam\'s project',
      date: DateTime.now().add(const Duration(hours: 6, minutes: 30)),
      isDone: false),
  Task(
      title: 'Desktop UI mockup design',
      date: DateTime.now().add(const Duration(hours: 8)),
      isDone: false),
];
