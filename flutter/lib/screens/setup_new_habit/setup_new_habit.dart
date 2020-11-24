import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/description_box.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/difficulty.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/flower_picker.dart';
import 'package:habit_garden/screens/setup_new_habit/widgets/header.dart';
import 'package:provider/provider.dart';

class SetupNewHabit extends StatelessWidget {
  final NewHabit newHabit;

  const SetupNewHabit({Key key, this.newHabit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TrackedHabit.fromNewHabit(newHabit),
      child: Scaffold(
        // debug button, prints current state of the newly create tracked habit
        floatingActionButton: Consumer<TrackedHabit>(
          builder: (_, trackedHabit, __) => FloatingActionButton(
            onPressed: () => print(jsonEncode(trackedHabit)),
          ),
        ),
        body: Column(
          children: [
            Header(title: newHabit.title, icon: "icon"),
            SizedBox(height: 10),
            Row(
              children: [
                FlowerPicker(),
                SizedBox(width: 10),
                Expanded(
                  child:
                      DescriptionBox(initialDescription: newHabit.description),
                ),
              ],
            ),
            SizedBox(height: 10),
            Difficulty(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
