import 'package:json_annotation/json_annotation.dart';

part 'tree_species_model.g.dart';

@JsonSerializable()
class TreeSpeciesModel {
  late int id;
  late String treeType;
  TreeSpeciesModel(this.id, this.treeType);

  factory TreeSpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$TreeSpeciesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TreeSpeciesModelToJson(this);
}
