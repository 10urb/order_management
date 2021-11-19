class CustomerModel {
  late int id;
  late String companyName;
  late String district;
  late String email;
  late String phoneNumber;
  late String note;
  late String relatedPerson;
  late String taxAdministration;
  late int taxNumber;
  CustomerModel(
      this.companyName,
      this.district,
      this.email,
      this.id,
      this.note,
      this.phoneNumber,
      this.relatedPerson,
      this.taxAdministration,
      this.taxNumber);
  CustomerModel.instance();
}
