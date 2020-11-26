import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_entry.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class ScheduleEntry {
  final int hour;
  final int minute;
  final Set<int> days;

  ScheduleEntry(this.hour, this.minute, this.days);

  ScheduleEntry.fromTimeOfDay(TimeOfDay time)
      : hour = time.hour,
        minute = time.minute,
        days = Set();

  ScheduleEntry.fromDateTime(DateTime time)
      : hour = time.hour,
        minute = time.minute,
        days = Set();

  factory ScheduleEntry.now() {
    return ScheduleEntry.fromDateTime(DateTime.now());
  }

  @override
  String toString() {
    String _addLeadingZeroIfNeeded(int value) {
      if (value < 10) return '0$value';
      return value.toString();
    }

    final String hourLabel = _addLeadingZeroIfNeeded(hour);
    final String minuteLabel = _addLeadingZeroIfNeeded(minute);

    return '$ScheduleEntry($hourLabel:$minuteLabel)';
  }

  factory ScheduleEntry.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEntryFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleEntryToJson(this);
}
