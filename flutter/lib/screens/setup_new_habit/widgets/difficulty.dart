import 'package:flutter/material.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:provider/provider.dart';

class Difficulty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Difficulty', style: TextStyle(fontSize: 20, color: Color(0xff30452D))),
        Slider(
          min: 0,
          max: 4,
          divisions: 4,
          value:
              context.select<TrackedHabit, int>((t) => t.difficulty).toDouble(),
          activeColor: Color(0xff657153),
          inactiveColor: Color(0xffA5A58D),
          onChanged: (d) =>
              context.read<TrackedHabit>().changeDifficulty(d.toInt()),
        ),
      ],
    );
  }
}
