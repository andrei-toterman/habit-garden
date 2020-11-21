import 'flower.dart';
import 'completion_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracked_habit.g.dart';

@JsonSerializable(explicitToJson: true)
class TrackedHabit {
  final String title;
  String description;
  final List schedule;
  final Flower flower;
  List<CompletionStatus> completionHistory = [];
  final DateTime creationDate;
  final int difficulty;

  set flowerX(double x) {
    flower.x = x;
  }

  set flowerY(double y) {
    flower.y = y;
  }

  TrackedHabit(this.title, this.description, this.schedule,
      this.flower, this.creationDate, this.difficulty);

  factory TrackedHabit.fromJson(Map<String, dynamic> json) =>
      _$TrackedHabitFromJson(json);

  Map<String, dynamic> toJson() => _$TrackedHabitToJson(this);
}
