import 'package:json_annotation/json_annotation.dart';


part 'flower.g.dart';

@JsonSerializable(explicitToJson: true)
class Flower{

  String name; //name
  int degradationLevel; // degradation level
  List assets;

  Flower(this.name, this.degradationLevel, this.assets); // assets

  factory Flower.fromJson(Map<String,dynamic> json) => _$FlowerFromJson(json);

  Map<String,dynamic> toJson() => _$FlowerToJson(this);
}