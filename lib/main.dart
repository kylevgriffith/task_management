import 'package:flutter/material.dart';

import 'helpers/contants.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: const ColorScheme.light().copyWith(
          brightness: Brightness.light,
          primary: primaryColor,
          secondary: accentColor,
        ),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: textColor,
          ),
        ),
      ),
      builder: (context, widget) {
        return ScrollConfiguration(
          behavior: const ScrollBehaviorModified(),
          child: widget!,
        );
      },
      home: const HomeScreen(),
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        );
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
