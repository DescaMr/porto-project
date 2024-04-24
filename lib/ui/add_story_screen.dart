import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Add Story Screen Page",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
