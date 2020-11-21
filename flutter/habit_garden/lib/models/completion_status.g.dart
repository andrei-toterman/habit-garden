// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletionStatus _$CompletionStatusFromJson(Map<String, dynamic> json) {
  return CompletionStatus(
    json['completionFlag'] as bool,
    json['journalEntry'] as String,
    json['moodLevel'] as int,
  );
}

Map<String, dynamic> _$CompletionStatusToJson(CompletionStatus instance) =>
    <String, dynamic>{
      'completionFlag': instance.completionFlag,
      'journalEntry': instance.journalEntry,
      'moodLevel': instance.moodLevel,
    };
