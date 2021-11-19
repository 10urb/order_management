import 'package:flutter/material.dart';

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
        body: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  addCustomerDialog(context);
                },
                child: const Text("Müşteri Ekle")),
            ElevatedButton(
                onPressed: () {}, child: const Text("Kalınlık Tanımlama")),
            ElevatedButton(
                onPressed: () {}, child: const Text("Sınıf Tanımlama")),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Tanımlamalar"),
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
                  decoration: const InputDecoration(
                      label: Text("Vergi No : *"),
                      border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _taxAdministrationController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Vergi Dairesi : *"),
                      border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _cityController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("İl :"), border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _districtController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("İlçe :"), border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _noteController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      label: Text("Ek Bilgi :"), border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      label: Text("Telefon Numarası :"),
                      border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _emailController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      label: Text("E-Posta Adresi :"),
                      border: OutlineInputBorder()),
                ),
                ElevatedButton(child: const Text('Onayla '), onPressed: () {}),
                ElevatedButton(
                  child: const Text('Vazgeç'),
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
