// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleEntry _$ScheduleEntryFromJson(Map<String, dynamic> json) {
  return ScheduleEntry(
    json['hour'] as int,
    json['minute'] as int,
    (json['days'] as List).map((e) => e as int).toSet(),
  );
}

Map<String, dynamic> _$ScheduleEntryToJson(ScheduleEntry instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'days': instance.days.toList(),
    };
