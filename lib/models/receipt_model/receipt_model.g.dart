// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) => ReceiptModel(
      receiptValue: (json['receiptValue'] as List<dynamic>?)
          ?.map((e) => ReceiptValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      companyName: json['companyName'] as String?,
      customerId: json['customerId'] as String?,
      createdAt: json['createdAt'] as String?,
      shipmentDate: json['shipmentDate'] as String?,
      status: json['status'] as String?,
      receiptId: json['receiptId'] as String?,
    );

Map<String, dynamic> _$ReceiptModelToJson(ReceiptModel instance) =>
    <String, dynamic>{
      'receiptId': instance.receiptId,
      'customerId': instance.customerId,
      'companyName': instance.companyName,
      'createdAt': instance.createdAt,
      'shipmentDate': instance.shipmentDate,
      'status': instance.status,
      'receiptValue': instance.receiptValue,
    };

ReceiptValue _$ReceiptValueFromJson(Map<String, dynamic> json) => ReceiptValue(
      decimeter: (json['decimeter'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      thickness: (json['thickness'] as num?)?.toDouble(),
      treeClass: json['treeClass'] as String?,
      width: (json['width'] as num?)?.toDouble(),
      partyNumber: json['partyNumber'] as String?,
    );

Map<String, dynamic> _$ReceiptValueToJson(ReceiptValue instance) =>
    <String, dynamic>{
      'thickness': instance.thickness,
      'treeClass': instance.treeClass,
      'height': instance.height,
      'width': instance.width,
      'decimeter': instance.decimeter,
      'partyNumber': instance.partyNumber,
    };
