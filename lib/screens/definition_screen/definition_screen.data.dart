part of 'definition_screen.dart';

CustomerService _service = CustomerService();

Validators _validator = Validators();

var _formKey = GlobalKey<FormState>();

var _newCompanyName,
    _newDistrict,
    _newEmmail,
    _newId,
    _newNote,
    _newPhoneNumber,
    _newRelatedPerson,
    _newTaxAdministration,
    _newCity,
    _newTown,
    _newTaxNumber,
    _newThickness,
    _newTreeClass,
    _newCreatedAt = DateTime.now().toString();

TextFormField relatedPersonTextFormField() {
  return TextFormField(
    onChanged: (value) => _newRelatedPerson = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.name,
    decoration: const InputDecoration(
        label: Text("İlgili Kişi :"), border: OutlineInputBorder()),
  );
}

TextFormField emailTextFormField() {
  return TextFormField(
    validator: _validator.emailValidator,
    onChanged: (value) => _newEmmail = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
        label: Text(InStrings.E_POSTA_ADRESI),
        border: const OutlineInputBorder()),
  );
}

TextFormField phoneNumberTextFormField() {
  return TextFormField(
    onChanged: (value) => _newPhoneNumber = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
        label: Text(InStrings.TELEFON_NUMARASI),
        border: const OutlineInputBorder()),
  );
}

TextFormField idTextFormField() {
  return TextFormField(
    readOnly: true,
    onChanged: (value) => _newId = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        label: Text(InStrings.MUSTERI_NUMARASI),
        border: const OutlineInputBorder()),
  );
}

TextFormField noteTextFormField() {
  return TextFormField(
    onChanged: (value) => _newNote = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
        label: Text(InStrings.EK_BILGI), border: const OutlineInputBorder()),
  );
}

TextFormField districtTextFormField() {
  return TextFormField(
    onChanged: (value) => _newDistrict = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
        label: Text(InStrings.SEMT), border: const OutlineInputBorder()),
  );
}

TextFormField townTextFormField() {
  return TextFormField(
    validator: _validator.requiredValidator,
    onChanged: (value) => _newTown = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
        label: Text(InStrings.ILCE), border: const OutlineInputBorder()),
  );
}

TextFormField cityTextFormField() {
  return TextFormField(
    validator: _validator.requiredValidator,
    onChanged: (value) => _newCity = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
        label: Text(InStrings.IL), border: const OutlineInputBorder()),
  );
}

TextFormField taxAdministrationTextFormField() {
  return TextFormField(
    onChanged: (value) => _newTaxAdministration = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
        label: Text(InStrings.VERGI_DAIRESI),
        border: const OutlineInputBorder()),
  );
}

TextFormField taxNumberTextFormField() {
  return TextFormField(
    onChanged: (value) => _newTaxNumber = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        label: Text(InStrings.VERGI_NO), border: const OutlineInputBorder()),
  );
}

TextFormField companyNameTextFormField() {
  return TextFormField(
    validator: _validator.requiredValidator,
    onChanged: (value) => _newCompanyName = value,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.name,
    decoration: const InputDecoration(
        label: Text("Şirket Adı : *"), border: OutlineInputBorder()),
  );
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.black38,
    title: Text(InStrings.TANIMLAMA),
  );
}
