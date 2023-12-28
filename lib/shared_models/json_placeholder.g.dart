// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_placeholder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonModel _$JsonModelFromJson(Map<String, dynamic> json) => JsonModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$JsonModelToJson(JsonModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
