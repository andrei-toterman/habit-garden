// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracked_habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackedHabit _$TrackedHabitFromJson(Map<String, dynamic> json) {
  return TrackedHabit(
    json['title'] as String,
    json['description'] as String,
    json['schedule'] as List,
    json['flower'] == null
        ? null
        : Flower.fromJson(json['flower'] as Map<String, dynamic>),
    json['creationDate'] == null
        ? null
        : DateTime.parse(json['creationDate'] as String),
    json['difficulty'] as int,
  )..completionHistory = (json['completionHistory'] as List)
      ?.map((e) => e == null
          ? null
          : CompletionStatus.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$TrackedHabitToJson(TrackedHabit instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'schedule': instance.schedule,
      'flower': instance.flower?.toJson(),
      'completionHistory':
          instance.completionHistory?.map((e) => e?.toJson())?.toList(),
      'creationDate': instance.creationDate?.toIso8601String(),
      'difficulty': instance.difficulty,
    };
