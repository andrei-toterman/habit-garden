import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

class Difficulty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Difficulty', style: TextStyle(fontSize: 20, color: Colors.black)),
        Slider(
          min: 0,
          max: 4,
          divisions: 4,
          value:
              context.select<TrackedHabit, int>((t) => t.difficulty).toDouble(),
          activeColor: Colors.black,
          inactiveColor: Colors.white,
          onChanged: (d) =>
              context.read<TrackedHabit>().changeDifficulty(d.toInt()),
        ),
      ],
    );
  }
}
