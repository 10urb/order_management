// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => CustomerValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

CustomerValue _$CustomerValueFromJson(Map<String, dynamic> json) =>
    CustomerValue(
      companyName: json['companyName'] as String?,
      district: json['district'] as String?,
      email: json['email'] as String?,
      id: json['id'] as String?,
      note: json['note'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      relatedPerson: json['relatedPerson'] as String?,
      taxAdministration: json['taxAdministration'] as String?,
      city: json['city'] as String?,
      status: json['status'] as bool?,
      town: json['town'] as String?,
      taxNumber: json['taxNumber'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CustomerValueToJson(CustomerValue instance) =>
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
      'city': instance.city,
      'town': instance.town,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };
