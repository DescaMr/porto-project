import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (BuildContext context, contraints) {
        if (contraints.maxWidth < 600) {
          return ListView(
            children: _generateConstraints(),
          );
        } else if (contraints.maxWidth < 900) {
          return GridView.count(
            crossAxisCount: 2,
            children: _generateConstraints(),
          );
        } else {
          return GridView.count(
            crossAxisCount: 6,
            children: _generateConstraints(),
          );
        }
      }),
    );
  }

  List<Widget> _generateConstraints() {
    return List<Widget>.generate(10, (index) {
      return Container(
        margin: EdgeInsets.all(8),
        color: Colors.blueGrey,
        height: 200,
      );
    });
  }
}
