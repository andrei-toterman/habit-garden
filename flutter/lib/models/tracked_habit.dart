import 'package:flutter/cupertino.dart';
import 'package:habit_garden/models/new_habit.dart';
import 'package:habit_garden/models/schedule_entry.dart';

import 'flower.dart';
import 'completion_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracked_habit.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class TrackedHabit extends ChangeNotifier {
  final String title;
  String description;
  final List<ScheduleEntry> schedules;
  final Flower flower;
  final List<CompletionStatus> completionHistory;
  final DateTime creationDate;
  int difficulty;

  set flowerX(double x) {
    flower.x = x;
    notifyListeners();
  }

  set flowerY(double y) {
    flower.y = y;
    notifyListeners();
  }

  addSchedule(ScheduleEntry entry) {
    schedules.add(entry);
    notifyListeners();
  }

  removeSchedule(ScheduleEntry entry) {
    schedules.remove(entry);
    notifyListeners();
  }

  addStatus(CompletionStatus status) {
    completionHistory.add(status);
    notifyListeners();
  }

  changeDifficulty(int d) {
    difficulty = d;
    notifyListeners();
  }

  TrackedHabit(this.title, this.description, this.schedules, this.flower,
      this.completionHistory, this.creationDate, this.difficulty);

  TrackedHabit.fromNewHabit(NewHabit newHabit)
      : this(newHabit.title, newHabit.description, [], Flower.defaultFlower(),
            [], DateTime.now(), 2);

  factory TrackedHabit.fromJson(Map<String, dynamic> json) =>
      _$TrackedHabitFromJson(json);

  Map<String, dynamic> toJson() => _$TrackedHabitToJson(this);
}
