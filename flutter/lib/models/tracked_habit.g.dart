// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracked_habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackedHabit _$TrackedHabitFromJson(Map<String, dynamic> json) {
  return TrackedHabit(
    json['title'] as String,
    json['description'] as String,
    (json['schedules'] as List)
        .map((e) => ScheduleEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
    Flower.fromJson(json['flower'] as Map<String, dynamic>),
    (json['completionHistory'] as List)
        .map((e) => CompletionStatus.fromJson(e as Map<String, dynamic>))
        .toList(),
    DateTime.parse(json['creationDate'] as String),
    json['difficulty'] as int,
  );
}

Map<String, dynamic> _$TrackedHabitToJson(TrackedHabit instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'schedules': instance.schedules.map((e) => e.toJson()).toList(),
      'flower': instance.flower.toJson(),
      'completionHistory':
          instance.completionHistory.map((e) => e.toJson()).toList(),
      'creationDate': instance.creationDate.toIso8601String(),
      'difficulty': instance.difficulty,
    };
