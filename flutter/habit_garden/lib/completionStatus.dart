import 'package:json_annotation/json_annotation.dart';

part 'completionStatus.g.dart';

@JsonSerializable(explicitToJson: true)
class CompletionStatus{
  String completionFlag;
  String feedback;

  CompletionStatus(this.completionFlag, this.feedback);

  factory CompletionStatus.fromJson(Map<String,dynamic> json) => _$CompletionStatusFromJson(json);

  Map<String,dynamic> toJson() => _$CompletionStatusToJson(this);
}