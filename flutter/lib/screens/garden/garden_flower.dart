import 'package:flutter/material.dart';
import 'package:habit_garden/models/flower.dart';

class GardenFlower extends StatelessWidget {
  final Flower flower;

  const GardenFlower(this.flower, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(flower.x * 2 - 1, flower.y * 2 - 1),
      child: Container(
        width: 200,
        child:
            Image.asset('assets/flowers/${flower.type}_${flower.health}.png'),
      ),
    );
  }
}
