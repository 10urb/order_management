// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/in_strings.dart';
import 'package:order_printer_management/helper/utilities/validators.dart';
import 'package:order_printer_management/models/customer_model/customer_model.dart';
import 'package:order_printer_management/services/customer_service.dart';
import 'package:order_printer_management/style/in_style.dart';
part 'definition_screen.data.dart';

class DefinitionScreen extends StatefulWidget {
  const DefinitionScreen({Key? key}) : super(key: key);

  @override
  _DefinitionScreenState createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
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
                    if (_formKey.currentState!.validate()) {
                      CustomerValue newValue = CustomerValue(
                          companyName: _newCompanyName,
                          district: _newDistrict,
                          email: _newEmmail,
                          id: _newId,
                          note: _newNote,
                          phoneNumber: _newPhoneNumber,
                          relatedPerson: _newRelatedPerson,
                          taxAdministration: _newTaxAdministration,
                          city: _newCity,
                          town: _newTown,
                          status: true,
                          taxNumber: _newTaxNumber);

                      newValueList.add(newValue);

                      newCustomerModel = CustomerModel(value: newValueList);
                      addCustomerPut();
                    }
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
                  controller: _newThickness,
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
                  controller: _newTreeClass,
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
