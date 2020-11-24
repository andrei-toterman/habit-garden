import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

class FlowerPicker extends StatefulWidget {
  static final types = ['type1', 'type2', 'type3'];

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
        child: Text(
          FlowerPicker.types[typeIdx],
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 3),
        ),
      ),
    );
  }
}
