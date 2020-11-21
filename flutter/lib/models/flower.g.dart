// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flower.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flower _$FlowerFromJson(Map<String, dynamic> json) {
  return Flower(
    json['type'] as String,
    json['health'] as int,
    (json['x'] as num)?.toDouble(),
    (json['y'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FlowerToJson(Flower instance) => <String, dynamic>{
      'type': instance.type,
      'health': instance.health,
      'x': instance.x,
      'y': instance.y,
    };
