import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel {
  late int? id;
  late String? companyName;
  late String? district;
  late String? email;
  late String? phoneNumber;
  late String? note;
  late String? relatedPerson;
  late String? taxAdministration;
  late int? taxNumber;
  CustomerModel(
      {this.companyName,
      this.district,
      this.email,
      this.id,
      this.note,
      this.phoneNumber,
      this.relatedPerson,
      this.taxAdministration,
      this.taxNumber});

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
