import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:habit_garden/models/tracked_habit.dart';
import 'package:path_provider/path_provider.dart';

class AppState extends ChangeNotifier {
  static const _tracked_habits_file = 'tracked_habits.json';

  List<TrackedHabit> _trackedHabits;

  Future<AppState> load() async {
    await _loadTrackedHabits();
    return this;
  }

  _loadTrackedHabits() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}$_tracked_habits_file');
      final data = await file.readAsString();
      _trackedHabits = (jsonDecode(data) as List)
          .map((th) => TrackedHabit.fromJson(th))
          .toList();
    } catch (_) {
      _trackedHabits = [];
    }
    print(jsonEncode(_trackedHabits));
  }

  _storeTrackedHabits() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}$_tracked_habits_file');
    await file.writeAsString(jsonEncode(_trackedHabits));
  }

  addTrackedHabit(TrackedHabit trackedHabit) {
    _trackedHabits.add(trackedHabit);
    _storeTrackedHabits();
    notifyListeners();
  }
}
