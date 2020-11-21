import 'package:flutter/material.dart';
import 'package:habit_garden/app_state.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/screens/new_habit_list.dart';

void main() => runApp(App());

class App extends InheritedWidget {
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static App of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<App>();
  }

  final AppState state = AppState();

  final Widget child = MaterialApp(
    home: NewHabitList(
      newHabits: List.generate(10, (index) {
        return NewHabit(
          "title $index",
          "description $index",
        );
      }),
    ),
  );
}
