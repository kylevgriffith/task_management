import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/main_widgets.dart';
import 'components/top_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            const TopWidgets(),
            verticalSpace(),
            const MainWidgets(),
          ],
        ),
      ),
    );
  }

  SizedBox verticalSpace() => SizedBox(height: Get.height * 0.03);
}
