import 'package:json_annotation/json_annotation.dart';

part 'json_placeholder.g.dart';

@JsonSerializable()
class JsonModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  JsonModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory JsonModel.fromJson(Map<String, dynamic> json) =>
      _$JsonModelFromJson(json);
  Map<String, dynamic> toJson() => _$JsonModelToJson(this);
}
