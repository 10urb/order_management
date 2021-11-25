// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      companyName: json['companyName'] as String?,
      district: json['district'] as String?,
      email: json['email'] as String?,
      id: json['id'] as int?,
      note: json['note'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      relatedPerson: json['relatedPerson'] as String?,
      taxAdministration: json['taxAdministration'] as String?,
      taxNumber: json['taxNumber'] as int?,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'district': instance.district,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'note': instance.note,
      'relatedPerson': instance.relatedPerson,
      'taxAdministration': instance.taxAdministration,
      'taxNumber': instance.taxNumber,
    };
