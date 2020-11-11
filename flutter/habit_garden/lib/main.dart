import 'package:flutter/material.dart';
import 'package:habit_garden/new_habit_selection.dart';
import 'package:habit_garden/possible_habit_model.dart';
import 'package:habit_garden/setup_new_habit.dart';

void main() {
  runApp(MaterialApp(
      home: NewHabitSelectionScreen(
    possibleHabitModels: List.generate(
        10,
        (i) =>
            PossibleHabitModel('possible habit $i', 'short description $i')),
  )));
}
