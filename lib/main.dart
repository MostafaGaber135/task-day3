import 'package:flutter/material.dart';
import 'package:task_day3/screens/home_screen.dart';
import 'package:task_day3/screens/login_screen.dart';
import 'package:task_day3/screens/register_screen.dart';
import 'package:task_day3/screens/start_screen.dart';
import 'package:task_day3/screens/on_view_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        OnViewBoardingScreen.routeName: (context) => OnViewBoardingScreen(),
        StartScreen.routeName: (context) => StartScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(userName: 'Guest'),
      },
      home: OnViewBoardingScreen(),
      initialRoute: OnViewBoardingScreen.routeName,
    );
  }
}
