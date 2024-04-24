import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Menu Page",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
