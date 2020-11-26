import 'dart:math';

import 'package:habit_garden/screens/setup_new_habit/widgets/flower_picker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flower.g.dart';

@JsonSerializable(explicitToJson: true)
class Flower {
  // the type and the health combined will identify the associated asset
  // i.e.  rose_3.png
  String type;
  int health;

  // coordinates for positioning inside garden, between 0 and 1
  double x, y;

  Flower(this.type, this.health, this.x, this.y);

  Flower.defaultFlower()
      : this(FlowerPicker.types.first, 4, Random().nextDouble(),
            Random().nextDouble());

  factory Flower.fromJson(Map<String, dynamic> json) => _$FlowerFromJson(json);

  Map<String, dynamic> toJson() => _$FlowerToJson(this);
}
