// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completionStatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletionStatus _$CompletionStatusFromJson(Map<String, dynamic> json) {
  return CompletionStatus(
    json['completionFlag'] as String,
    json['feedback'] as String,
  );
}

Map<String, dynamic> _$CompletionStatusToJson(CompletionStatus instance) =>
    <String, dynamic>{
      'completionFlag': instance.completionFlag,
      'feedback': instance.feedback,
    };
