import 'package:json_annotation/json_annotation.dart';

part 'flower.g.dart';

@JsonSerializable(explicitToJson: true)
class Flower {
  // the type and the health combined will identify the associated asset
  // i.e.  rose_3.png
  final String type;
  int health;
  // coordinates for positioning inside garden
  double x, y;

  Flower(this.type, this.health, this.x, this.y);

  factory Flower.fromJson(Map<String, dynamic> json) => _$FlowerFromJson(json);

  Map<String, dynamic> toJson() => _$FlowerToJson(this);
}
