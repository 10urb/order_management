import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/in_strings.dart';
import 'package:order_printer_management/style/in_style.dart';

class DefinitionScreen extends StatefulWidget {
  const DefinitionScreen({Key? key}) : super(key: key);

  @override
  _DefinitionScreenState createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _relatedPersonController =
      TextEditingController();
  final TextEditingController _taxNumberController = TextEditingController();
  final TextEditingController _taxAdministrationController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: Container(
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
        ),
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: const Text(
                'Müşteri Ekle',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextFormField(
                  controller: _companyNameController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Şirket Adı : *"),
                      border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _relatedPersonController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("İlgili Kişi :"),
                      border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _taxNumberController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text(InStrings.VERGI_NO),
                      border: const OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _taxAdministrationController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text(InStrings.VERGI_DAIRESI),
                      border: const OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _cityController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text(InStrings.IL),
                      border: const OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _districtController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text(InStrings.ILCE),
                      border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _noteController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      label: Text(InStrings.EK_BILGI),
                      border: const OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      label: Text(InStrings.TELEFON_NUMARASI),
                      border: const OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _emailController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      label: Text(InStrings.E_POSTA_ADRESI),
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
                  controller: _companyNameController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
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
                  controller: _companyNameController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
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
