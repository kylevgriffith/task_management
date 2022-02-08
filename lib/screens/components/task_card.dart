import 'package:flutter/material.dart';

import '../../helpers/extesnsion.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {required this.title,
      required this.date,
      required this.progress,
      required this.color,
      Key? key})
      : super(key: key);
  final String title;
  final int progress;
  final DateTime date;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leftTaskTime(),
            taskTitle(),
            taskProgress(),
          ],
        ),
      ),
    );
  }

  Widget taskProgress() {
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

  Align taskTitle() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }

  Align leftTaskTime() {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        date.leftTime + ' left',
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }
}
