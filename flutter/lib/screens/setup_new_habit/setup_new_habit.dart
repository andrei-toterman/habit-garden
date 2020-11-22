import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit_garden/models/flower.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/description_box.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/difficulty.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/flower_picker.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/header.dart';

class SetupNewHabit extends StatefulWidget {
  final NewHabit model;

  const SetupNewHabit({Key key, this.model}) : super(key: key);

  @override
  _SetupNewHabitState createState() => _SetupNewHabitState();
}

class _SetupNewHabitState extends State<SetupNewHabit> {
  TrackedHabit newTracked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(jsonEncode(newTracked)),
      ),
      body: Column(
        children: [
          Header(title: widget.model.title, icon: "icon"),
          SizedBox(height: 10),
          Row(
            children: [
              FlowerPicker((String type) => newTracked.flower.type = type),
              SizedBox(width: 10),
              Expanded(
                child: DescriptionBox(
                      (String description) => newTracked.description = description,
                  initialDescription: widget.model.description,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Difficulty((int difficulty) => newTracked.difficulty = difficulty),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    newTracked = TrackedHabit(
        widget.model.title,
        widget.model.description,
        [],
        Flower(
          FlowerPicker.flowerTypes[0],
          5,
          Random().nextDouble(),
          Random().nextDouble(),
        ),
        [],
        DateTime.now(),
        2);
  }
}
