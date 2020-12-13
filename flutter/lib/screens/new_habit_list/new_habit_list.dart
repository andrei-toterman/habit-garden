import 'package:flutter/material.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/screens/app_drawer.dart';
import 'package:habit_garden/screens/setup_new_habit/setup_new_habit.dart';

import 'new_habit_card.dart';

class NewHabitList extends StatelessWidget {
  static const route = 'new_habit_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF1E6),
      drawer: AppDrawer(),
      body: ListView(
        children: newHabits.map((habit) => NewHabitCard(
            model: habit,
            onTap: () => Navigator.pushNamed(
              context,
              SetupNewHabit.route,
              arguments: habit,
            ),
          )).toList(),
      ),
    );
  }

  final List<NewHabit> newHabits = [
    NewHabit(
      'Exercise',
      'stretch in the morning, go for a jog',
    ),
    NewHabit(
      'Less technology',
      'check your feed just once a day, take a break from your computer every hour',
    ),
    NewHabit(
      'Eat healthier',
      'more greens, less sugars',
    ),
    NewHabit(
      'Quit',
      'no more smoking and less coffee',
    ),
    NewHabit(
      'Sleep',
      'get at least 8 hours',
    ),
    NewHabit(
      'Read',
      'comic books don\'t count',
    ),
    NewHabit(
      'Socialize',
      'call your grandma, meet with your old pals',
    ),
    NewHabit(
      'Take care',
      'water your real flower, and feed your fish',
    ),
    NewHabit(
      'Practice',
      'that guitar won\'t play itself',
    ),
    NewHabit(
      'Mental health',
      'meditate in the morning',
    ),
  ];
}
