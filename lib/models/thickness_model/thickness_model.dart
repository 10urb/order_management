import 'package:json_annotation/json_annotation.dart';

part 'thickness_model.g.dart';

@JsonSerializable()
class ThicknessModel {
  double? thicknessNumber;
  ThicknessModel({this.thicknessNumber});

  factory ThicknessModel.fromJson(Map<String, dynamic> json) =>
      _$ThicknessModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThicknessModelToJson(this);
}
