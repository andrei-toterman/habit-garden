import 'package:flutter/material.dart';

class Garden extends StatelessWidget {
  static const route = 'garden';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9fde65),
      body: Stack(
        children: [
          buildFlower('orange', 3),
          buildFlower('yellow', 2),
        ],
      ),
    );
  }

  Container buildFlower(String type, int health) {
    return Container(
          child: Image.asset("assets/flowers/${type}_$health.png"),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 3),
          ),
        );
  }
}
