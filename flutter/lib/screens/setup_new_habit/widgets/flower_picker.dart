import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

class FlowerPicker extends StatefulWidget {
  static final types = ['red', 'yellow', 'orange', 'black'];

  @override
  _FlowerPickerState createState() => _FlowerPickerState();
}

class _FlowerPickerState extends State<FlowerPicker> {
  int typeIdx = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (drag) {
        setState(() {
          typeIdx = (typeIdx - drag.primaryVelocity.sign.toInt()) %
              FlowerPicker.types.length;
        });
        context.read<TrackedHabit>().flower.type = FlowerPicker.types[typeIdx];
      },
      child: Container(
        width: 150,
        height: 150,
        alignment: Alignment.center,
        child:
            Image.asset('assets/flowers/${FlowerPicker.types[typeIdx]}_4.png'),
        decoration: BoxDecoration(
          color: Color(0xffA5A58D),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
