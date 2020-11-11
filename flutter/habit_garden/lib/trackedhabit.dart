import 'flower.dart';
import 'completionStatus.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'trackedhabit.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)

class TrackedHabit {

  final int uniqueId; // unique id for tracked habit
  String title; // title
  String description; // description for tracked habit
  List reminders; // list of dates and times for reminders
  Flower flower; // associated flower
  List<CompletionStatus> statuses; // list of completion statuses
  DateTime creationdate;


  TrackedHabit(this.uniqueId, this.title, this.description, this.reminders,
      this.flower, this.statuses, this.creationdate);

  factory TrackedHabit.fromJson(Map<String,dynamic> json) => _$TrackedHabitFromJson(json);

  Map<String,dynamic> toJson() => _$TrackedHabitToJson(this);

}