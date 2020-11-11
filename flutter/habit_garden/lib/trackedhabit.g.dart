// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trackedhabit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackedHabit _$TrackedHabitFromJson(Map<String, dynamic> json) {
  return TrackedHabit(
    json['uniqueId'] as int,
    json['title'] as String,
    json['description'] as String,
    json['reminders'] as List,
    json['flower'] == null
        ? null
        : Flower.fromJson(json['flower'] as Map<String, dynamic>),
    (json['statuses'] as List)
        ?.map((e) => e == null
            ? null
            : CompletionStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['creationdate'] == null
        ? null
        : DateTime.parse(json['creationdate'] as String),
  );
}

Map<String, dynamic> _$TrackedHabitToJson(TrackedHabit instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'title': instance.title,
      'description': instance.description,
      'reminders': instance.reminders,
      'flower': instance.flower?.toJson(),
      'statuses': instance.statuses?.map((e) => e?.toJson())?.toList(),
      'creationdate': instance.creationdate?.toIso8601String(),
    };
