import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:path_provider/path_provider.dart';

class AppState extends ChangeNotifier {
  static const _tracked_habits_file = 'tracked_habits.json';

  List<TrackedHabit> trackedHabits = [];

  AppState() {
    _loadTrackedHabits();
  }

  _loadTrackedHabits() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$_tracked_habits_file');
      final data = await file.readAsString();
      trackedHabits = (jsonDecode(data) as List)
          .map((th) => TrackedHabit.fromJson(th))
          .toList();
    } catch (_) {
      trackedHabits = [];
    }
    notifyListeners();
  }

  _storeTrackedHabits() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$_tracked_habits_file');
    await file.writeAsString(jsonEncode(trackedHabits));
  }

  addTrackedHabit(TrackedHabit trackedHabit) {
    trackedHabits.add(trackedHabit);
    _storeTrackedHabits();
    notifyListeners();
  }
}
