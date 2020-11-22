import 'package:flutter/material.dart';

class Difficulty extends StatefulWidget {
  final Function(int difficulty) updateDifficulty;

  const Difficulty(this.updateDifficulty, {Key key}) : super(key: key);

  @override
  _DifficultyState createState() => _DifficultyState();
}

class _DifficultyState extends State<Difficulty> {
  double difficulty = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'difficulty',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Slider(
          min: 0,
          max: 4,
          divisions: 4,
          value: difficulty,
          activeColor: Colors.black,
          inactiveColor: Colors.white,
          onChanged: (double value) {
            setState(() {
              difficulty = value;
            });
            widget.updateDifficulty(difficulty.toInt());
          },
        ),
      ],
    );
  }
}
