import 'package:flutter/material.dart';
import 'package:habit_garden/app_state.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/screens/new_habit_list.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      FutureProvider<AppState>(
        create: (_) => AppState().load(),
        lazy: false,
        builder: (context, _) => MaterialApp(
          title: "Habit Garden",
          home: NewHabitList([
            NewHabit('Exercise', 'stretch in the morning, go for a jog'),
            NewHabit('Less social media', 'check your feed just once a day'),
            NewHabit('Eat healthier', 'more greens, less sugars'),
            NewHabit('Quit', 'no more smoking and less coffee'),
            NewHabit('Sleep', 'get at least 8 hours'),
            NewHabit('Read', 'comic books don\'t count'),
            NewHabit('Socialize', 'call your grandma, meet with your old pals'),
            NewHabit('Take care', 'water your real flower, and feed your fish'),
            NewHabit('Practice', 'that guitar won\'t play itself'),
            NewHabit('Mental health', 'meditate in the morning'),
          ]),
        ),
      ),
    );
