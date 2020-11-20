import 'dart:convert';
import 'dart:io';

import 'package:habit_garden/models/tracked_habit.dart';
import 'package:path_provider/path_provider.dart';

class AppState {
  static const _tracked_habits_file = 'tracked_habits.json';

  List<TrackedHabit> _trackedHabits;

  AppState() {
    _loadTrackedHabits();
  }

  _loadTrackedHabits() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}$_tracked_habits_file');
      final data = await file.readAsString();
      this._trackedHabits = (jsonDecode(data) as List)
          .map((th) => TrackedHabit.fromJson(th))
          .toList();
    } catch (e) {
      print(e);
    }
  }

  _storeTrackedHabits() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}$_tracked_habits_file');
    final data = jsonEncode(this._trackedHabits);
    await file.writeAsString(data);
  }

  addTrackedHabit(TrackedHabit trackedHabit) {
    this._trackedHabits.add(trackedHabit);
    _storeTrackedHabits();
  }
}
