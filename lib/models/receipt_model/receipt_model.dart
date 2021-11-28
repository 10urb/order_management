import 'package:json_annotation/json_annotation.dart';

part 'receipt_model.g.dart';

@JsonSerializable()
class ReceiptModel {
  String? receiptId;
  String? customerId;
  String? companyName;
  String? createdAt = DateTime.now().toString();
  String? shipmentDate;
  String? status;
  List<ReceiptValue>? receiptValue;

  ReceiptModel(
      {this.receiptValue,
      this.companyName,
      this.customerId,
      this.createdAt,
      this.shipmentDate,
      this.status,
      this.receiptId});

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptModelToJson(this);
}

@JsonSerializable()
class ReceiptValue {
  double? thickness;
  String? treeClass;
  double? height;
  double? width;
  double? decimeter;

  String? partyNumber;

  ReceiptValue(
      {this.decimeter,
      this.height,
      this.thickness,
      this.treeClass,
      this.width,
      this.partyNumber});

  factory ReceiptValue.fromJson(Map<String, dynamic> json) =>
      _$ReceiptValueFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptValueToJson(this);
}
