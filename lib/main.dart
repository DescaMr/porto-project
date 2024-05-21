import 'package:flutter/material.dart';
import 'package:porto_project/components/splash_Screen.dart';
import 'package:porto_project/ui/add_story_screen.dart';
import 'package:porto_project/ui/login_screen.dart';
import 'package:porto_project/ui/signup_screen.dart';
// import 'ui/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AddStoryScreen(),
    );
  }
}
