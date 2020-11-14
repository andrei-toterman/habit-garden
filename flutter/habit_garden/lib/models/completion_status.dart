import 'package:json_annotation/json_annotation.dart';

part 'completion_status.g.dart';

@JsonSerializable(explicitToJson: true)
class CompletionStatus {
  final bool completionFlag;
  final String journalEntry;
  final int moodLevel;

  CompletionStatus(this.completionFlag, this.journalEntry, this.moodLevel);

  factory CompletionStatus.fromJson(Map<String, dynamic> json) =>
      _$CompletionStatusFromJson(json);

  Map<String, dynamic> toJson() => _$CompletionStatusToJson(this);
}
