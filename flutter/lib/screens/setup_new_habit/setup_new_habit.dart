import 'package:flutter/material.dart';
import 'package:habit_garden/models/new_habit.dart';

class SetupNewHabit extends StatefulWidget {
  final NewHabit model;

  const SetupNewHabit({Key key, this.model}) : super(key: key);

  @override
  _SetupNewHabitState createState() => _SetupNewHabitState();
}

class _SetupNewHabitState extends State<SetupNewHabit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
