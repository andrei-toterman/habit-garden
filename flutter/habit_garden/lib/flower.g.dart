// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flower.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flower _$FlowerFromJson(Map<String, dynamic> json) {
  return Flower(
    json['name'] as String,
    json['degradationLevel'] as int,
    json['assets'] as List,
  );
}

Map<String, dynamic> _$FlowerToJson(Flower instance) => <String, dynamic>{
      'name': instance.name,
      'degradationLevel': instance.degradationLevel,
      'assets': instance.assets,
    };
