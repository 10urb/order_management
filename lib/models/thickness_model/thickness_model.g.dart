// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thickness_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThicknessModel _$ThicknessModelFromJson(Map<String, dynamic> json) =>
    ThicknessModel(
      thicknessValue: (json['thicknessValue'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$ThicknessModelToJson(ThicknessModel instance) =>
    <String, dynamic>{
      'thicknessValue': instance.thicknessValue,
    };
