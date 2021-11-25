import 'package:json_annotation/json_annotation.dart';
part 'tree_class_model.g.dart';

@JsonSerializable()
class TreeClassModel {
  double? classNumber;
  TreeClassModel({this.classNumber});

  factory TreeClassModel.fromJson(Map<String, dynamic> json) =>
      _$TreeClassModelFromJson(json);
  Map<String, dynamic> toJson() => _$TreeClassModelToJson(this);
}
