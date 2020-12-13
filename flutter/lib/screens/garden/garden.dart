import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/app_drawer.dart';
import 'package:habit_garden/screens/garden/garden_flower.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class Garden extends StatelessWidget {
  static const route = 'garden';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9fde65),
      drawer: AppDrawer(),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Selector<AppState, List<TrackedHabit>>(
            selector: (_, a) => [...a.trackedHabits],
            builder: (_, habits, __) => Stack(
              children: habits.map((e) => GardenFlower(e.flower)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
