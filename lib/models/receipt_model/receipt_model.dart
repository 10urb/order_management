import 'package:json_annotation/json_annotation.dart';

part 'receipt_model.g.dart';

@JsonSerializable()
class ReceiptModel {
  String? thickness;
  String? treeClass;
  double? height;
  double? width;
  double? decimeter;
  DateTime? createdAt;
  DateTime? shipmentDate;
  String? status;
  String? partyNumber;

  ReceiptModel(
      {this.createdAt,
      this.decimeter,
      this.height,
      this.shipmentDate,
      this.status,
      this.thickness,
      this.treeClass,
      this.width,
      this.partyNumber});

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptModelToJson(this);
}
