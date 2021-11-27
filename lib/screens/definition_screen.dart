// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/in_strings.dart';
import 'package:order_printer_management/helper/utilities/validators.dart';
import 'package:order_printer_management/models/customer_model/customer_model.dart';
import 'package:order_printer_management/services/customer_service.dart';
import 'package:order_printer_management/style/in_style.dart';

// partof '/order_printer_management/lib/screens/part_of_screens/definition_screen_part.dart';

class DefinitionScreen extends StatefulWidget {
  const DefinitionScreen({Key? key}) : super(key: key);

  @override
  _DefinitionScreenState createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
  CustomerService service = CustomerService();
  List<CustomerValue> newValueList = [];

  Validators _validator = Validators();

  var newCompanyName,
      newDistrict,
      newEmmail,
      newId,
      newNote,
      newPhoneNumber,
      newRelatedPerson,
      newTaxAdministration,
      newCity,
      newTown,
      newTaxNumber,
      newThickness,
      newTreeClass;
  late CustomerModel newCustomerModel;

  var _formKey = GlobalKey<FormState>();

  Future addCustomerPut() async {
    var response = await service.addPut(newCustomerModel);
    print(response.statusCode);

    print(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(context),
      ),
    );
  }

  Container buildBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 30,
          horizontal: MediaQuery.of(context).size.width / 20),
      child: ListView(
        children: [
          ElevatedButton(
              style: InStyle.signUpElevatedButtonStyle,
              onPressed: () {
                addCustomerDialog(context);
              },
              child: Text(InStrings.MUSTERI_EKLE)),
          ElevatedButton(
              style: InStyle.signUpElevatedButtonStyle,
              onPressed: () {
                addThicknessDialog(context);
              },
              child: Text(InStrings.KALINLIK_TANIMLAMA)),
          ElevatedButton(
              style: InStyle.signUpElevatedButtonStyle,
              onPressed: () {
                addQualityClassDialog(context);
              },
              child: Text(InStrings.SINIF_TANIMLAMA)),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black38,
      title: Text(InStrings.TANIMLAMA),
    );
  }

  addCustomerDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: const Text(
                'Müşteri Ekle',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                idTextFormField(),
                companyNameTextFormField(),
                relatedPersonTextFormField(),
                taxNumberTextFormField(),
                taxAdministrationTextFormField(),
                cityTextFormField(),
                townTextFormField(),
                districtTextFormField(),
                noteTextFormField(),
                phoneNumberTextFormField(),
                emailTextFormField(),
                ElevatedButton(
                  child: Text(InStrings.EKLE),
                  onPressed: () {
                    CustomerValue newValue = CustomerValue(
                        companyName: newCompanyName,
                        district: newDistrict,
                        email: newEmmail,
                        id: newId,
                        note: newNote,
                        phoneNumber: newPhoneNumber,
                        relatedPerson: newRelatedPerson,
                        taxAdministration: newTaxAdministration,
                        city: newCity,
                        town: newTown,
                        status: true,
                        taxNumber: newTaxNumber);

                    newValueList.add(newValue);

                    newCustomerModel = CustomerModel(value: newValueList);
                    addCustomerPut();
                  },
                  style: InStyle.successElevatedButtonStyle,
                ),
                ElevatedButton(
                  child: Text(InStrings.VAZGEC),
                  style: InStyle.cancelElevatedButtonStyle,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextFormField relatedPersonTextFormField() {
    return TextFormField(
      onChanged: (value) => newRelatedPerson = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
          label: Text("İlgili Kişi :"), border: OutlineInputBorder()),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      validator: _validator.emailValidator,
      onChanged: (value) => newEmmail = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          label: Text(InStrings.E_POSTA_ADRESI),
          border: const OutlineInputBorder()),
    );
  }

  TextFormField phoneNumberTextFormField() {
    return TextFormField(
      onChanged: (value) => newPhoneNumber = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          label: Text(InStrings.TELEFON_NUMARASI),
          border: const OutlineInputBorder()),
    );
  }

  TextFormField idTextFormField() {
    return TextFormField(
      validator: _validator.requiredValidator,
      readOnly: true,
      onChanged: (value) => newId = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text(InStrings.MUSTERI_NUMARASI),
          border: const OutlineInputBorder()),
    );
  }

  TextFormField noteTextFormField() {
    return TextFormField(
      onChanged: (value) => newNote = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          label: Text(InStrings.EK_BILGI), border: const OutlineInputBorder()),
    );
  }

  TextFormField districtTextFormField() {
    return TextFormField(
      onChanged: (value) => newDistrict = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          label: Text(InStrings.SEMT), border: const OutlineInputBorder()),
    );
  }

  TextFormField townTextFormField() {
    return TextFormField(
      validator: _validator.requiredValidator,
      onChanged: (value) => newTown = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          label: Text(InStrings.ILCE), border: const OutlineInputBorder()),
    );
  }

  TextFormField cityTextFormField() {
    return TextFormField(
      validator: _validator.requiredValidator,
      onChanged: (value) => newCity = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          label: Text(InStrings.IL), border: const OutlineInputBorder()),
    );
  }

  TextFormField taxAdministrationTextFormField() {
    return TextFormField(
      onChanged: (value) => newTaxAdministration = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          label: Text(InStrings.VERGI_DAIRESI),
          border: const OutlineInputBorder()),
    );
  }

  TextFormField taxNumberTextFormField() {
    return TextFormField(
      onChanged: (value) => newTaxNumber = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text(InStrings.VERGI_NO), border: const OutlineInputBorder()),
    );
  }

  TextFormField companyNameTextFormField() {
    return TextFormField(
      onChanged: (value) => newCompanyName = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
          label: Text("Şirket Adı : *"), border: OutlineInputBorder()),
    );
  }

  addThicknessDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Form(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                InStrings.KALINLIK_EKLE,
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextFormField(
                  controller: newThickness,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      label: Text(InStrings.KALINLIK),
                      border: const OutlineInputBorder()),
                ),
                ElevatedButton(
                  child: Text(InStrings.EKLE),
                  onPressed: () {},
                  style: InStyle.successElevatedButtonStyle,
                ),
                ElevatedButton(
                  child: Text(InStrings.VAZGEC),
                  style: InStyle.cancelElevatedButtonStyle,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  addQualityClassDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Form(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                InStrings.SINIF_EKLE,
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextFormField(
                  controller: newTreeClass,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      label: Text(InStrings.SINIF),
                      border: const OutlineInputBorder()),
                ),
                ElevatedButton(
                  child: Text(InStrings.EKLE),
                  onPressed: () {},
                  style: InStyle.successElevatedButtonStyle,
                ),
                ElevatedButton(
                  child: Text(InStrings.VAZGEC),
                  style: InStyle.cancelElevatedButtonStyle,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
