import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/task.dart';
import 'components/task_card.dart';

import '../helpers/contants.dart';
import 'components/time_frequency.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topScreenIcons(),
              const SizedBox(height: 40),
              userListTile(),
              const SizedBox(height: 40),
              const Text(
                'My tasks',
                style: kboldTextStyle,
              ),
              const SizedBox(height: 10),
              const TimeFrequency(),
              taskCards(),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView taskCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          tasksCardList.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TaskCard(
                title: tasksCardList[index].title,
                date: tasksCardList[index].date,
                progress: tasksCardList[index].progress),
          ),
        ),
      ),
    );
  }

  Row topScreenIcons() {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Menu.svg',
          semanticsLabel: 'Menu',
          height: 40,
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/icons/Search.svg',
          semanticsLabel: 'Search',
          height: 30,
        ),
        const SizedBox(
          width: 20,
        ),
        SvgPicture.asset(
          'assets/icons/Filter.svg',
          semanticsLabel: 'Filter',
          height: 35,
        ),
      ],
    );
  }

  ListTile userListTile() {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundColor: accentColor,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      title: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Hi, ',
              style: kdefaultTextStyle,
            ),
            TextSpan(
              text: 'John Doe',
              style: kboldTextStyle,
            ),
          ],
        ),
      ),
      subtitle: const Text(
        'Welcome back',
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
