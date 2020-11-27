import 'package:flutter/material.dart';
import 'package:habit_garden/app_state.dart';
import 'package:habit_garden/screens/garden/garden.dart';
import 'package:habit_garden/screens/new_habit_list/new_habit_list.dart';
import 'package:habit_garden/screens/setup_new_habit/setup_new_habit.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      FutureProvider<AppState>(
        create: (_) => AppState().load(),
        lazy: false,
        builder: (context, _) => MaterialApp(
          title: "Habit Garden",
          routes: {
            NewHabitList.route: (_) => NewHabitList(),
            SetupNewHabit.route: (_) => SetupNewHabit(),
            Garden.route: (_) => Garden(),
          },
          home: Garden(),
        ),
      ),
    );
