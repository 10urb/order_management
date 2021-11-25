import 'package:json_annotation/json_annotation.dart';

part 'create_receipt_model.g.dart';

@JsonSerializable()
class CreateReceiptModel {
  String? thickness;
  String? treeClass;
  double? height;
  double? width;
  double? decimeter;
  DateTime? createdAt;
  DateTime? shipmentDate;
  String? status;
  String? partyNumber;

  CreateReceiptModel(
      {this.createdAt,
      this.decimeter,
      this.height,
      this.shipmentDate,
      this.status,
      this.thickness,
      this.treeClass,
      this.width,
      this.partyNumber});

  factory CreateReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReceiptModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateReceiptModelToJson(this);
}
