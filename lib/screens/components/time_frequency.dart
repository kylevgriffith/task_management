import 'package:flutter/material.dart';

import '../../helpers/contants.dart';

const List<String> _timeFrequencies = [
  'Recently',
  'Today',
  'Upcoming',
  'Later'
];

class TimeFrequency extends StatefulWidget {
  const TimeFrequency({Key? key}) : super(key: key);

  @override
  _TimeFrequencyState createState() => _TimeFrequencyState();
}

class _TimeFrequencyState extends State<TimeFrequency> {
  String _selectedTime = _timeFrequencies.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _timeFrequencies.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedTime == _timeFrequencies[index];
          final time = _timeFrequencies[index];
          return Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () => changeItem(index),
              child: timeText(time, isSelected),
            ),
          );
        },
      ),
    );
  }

  Text timeText(String title, bool isSelected) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w300,
        color: isSelected ? primaryColor : Colors.grey,
      ),
    );
  }

  void changeItem(int index) {
    setState(() {
      _selectedTime = _timeFrequencies[index];
    });
  }
}
