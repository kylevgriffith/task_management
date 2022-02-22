import 'package:flutter/material.dart';

import '../../helpers/contants.dart';
import 'components/tasks/today_tasks.dart';

class MainWidgets extends StatelessWidget {
  const MainWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kDefaultRadius),
            topRight: Radius.circular(kDefaultRadius),
          ),
        ),
        child: tabs(),
      ),
    );
  }

  Widget tabs() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: const [
          TabBar(
            labelColor: Colors.black,
            indicatorColor: accentColor,
            padding: EdgeInsets.all(30),
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Today\'s Tasks (5)',
                  style: kTabsLabelTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Completed (2)',
                  style: kTabsLabelTextStyle,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TodayTasks(),
                TodayTasks(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
