import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel {
  List<CustomerValue>? value;

  CustomerModel({this.value});

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}

@JsonSerializable()
class CustomerValue {
  String? id;
  String? companyName;
  String? district;
  String? email;
  String? phoneNumber;
  String? note;
  String? relatedPerson;
  String? taxAdministration;
  String? taxNumber;
  String? city;
  String? town;
  bool? status;
  String? createdAt = DateTime.now().toString();
  CustomerValue(
      {this.companyName,
      this.district,
      this.email,
      this.id,
      this.note,
      this.phoneNumber,
      this.relatedPerson,
      this.taxAdministration,
      this.city,
      this.status,
      this.town,
      this.taxNumber,
      this.createdAt});
  factory CustomerValue.fromJson(Map<String, dynamic> json) =>
      _$CustomerValueFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerValueToJson(this);
}
