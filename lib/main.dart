import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

import 'contants.dart';

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
      home: const HomeScreen(),
    );
  }
}
