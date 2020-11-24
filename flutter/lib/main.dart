import 'package:flutter/material.dart';
import 'package:habit_garden/app_state.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/screens/new_habit_list.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        home: NewHabitList(
          newHabits: List.generate(10, (index) {
            return NewHabit(
              "title $index",
              "description $index",
            );
          }),
        ),
      ),
    ));
