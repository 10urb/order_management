// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:order_printer_management/helper/in_strings.dart';
import 'package:order_printer_management/models/customer_model/customer_model.dart';
import 'package:order_printer_management/services/customer_service.dart';
import 'package:order_printer_management/style/in_style.dart';

class CreateReceiptScreen extends StatefulWidget {
  const CreateReceiptScreen({Key? key}) : super(key: key);

  @override
  State<CreateReceiptScreen> createState() => _CreateReceiptScreenState();
}

class _CreateReceiptScreenState extends State<CreateReceiptScreen> {
  List<CustomerValue> customerModelValueList = [];

  late String newCustomer,
      newThickness,
      newTreeClass,
      newWidth,
      newHeight,
      newPartyNumber,
      newDecimeter;

  CustomerService service = CustomerService();
  Future getCustomers() async {
    CustomerService service = CustomerService();

    var response = await service.getAll();
    if (response.statusCode == 200) {
      var jsonModel = CustomerModel.fromJson(jsonDecode(response.body));

      for (var item in jsonModel.value!) {
        setState(() {
          customerModelValueList.add(item);
        });
      }
      print(customerModelValueList.length);
    } else {
      return response.statusCode;
    }
  }

  @override
  void initState() {
    getCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            bottomNavigationBar: buildBottomNavigationBar(),
            floatingActionButton: buildAddFloatingActionButton(context),
            appBar: buildAppbar(),
            body: buildBodyListview(context)));
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.equalizer,
          ),
          label: "Toplam Satır Sayısı : 2",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.equalizer),
          label: "Toplam Dm³ : 10",
        )
      ],
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.brown,
      title: const Text("Fiş Oluşturma"),
      centerTitle: false,
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          child: ElevatedButton(
              style: InStyle.cancelRedElevatedButtonStyle,
              onPressed: () {},
              onLongPress: () {},
              child: Text(InStrings.KAYDET_VE_YAZDIR)),
        )
      ],
    );
  }

  ListView buildBodyListview(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(MediaQuery.of(context).size.aspectRatio),
      children: [
        buildCustomerChooseDropdownField(),
        Row(
          children: <Widget>[
            Expanded(
              child: buildThicknessChooseDropdownField(),
            ),
            Expanded(
              child: buildTreeClassChooseDropdownField(),
            ),
          ],
        ),
        buildDataTableField(),
      ],
    );
  }

  Widget buildDataTableField() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return DataTable(
                  onSelectAll: (value) {},
                  showCheckboxColumn: true,
                  dividerThickness: 1,
                  showBottomBorder: true,
                  columns: const [
                    DataColumn(label: Text("Kalınlık")),
                    DataColumn(label: Text("En")),
                    DataColumn(label: Text("Boy")),
                    DataColumn(label: Text("Dm³"))
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text("Cell 1"), showEditIcon: false),
                      DataCell(Text("Cell 2"), showEditIcon: true),
                      DataCell(Text("Cell 3"), showEditIcon: true),
                      DataCell(Text("Cell 4")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("Kalınlık ")),
                      DataCell(Text("En 2")),
                      DataCell(Text("Boy 3")),
                      DataCell(Text("desimetre 4")),
                    ]),
                  ]);
            }),
      ),
    );
  }

  buildThicknessChooseDropdownField() {
    return Container(
      height: 60,
      child: DropdownSearch(
        mode: Mode.MENU,
        dropdownSearchDecoration: InputDecoration(
            hintText: InStrings.KALINLIK_SECINIZ,
            border: const OutlineInputBorder()),
      ),
    );
  }

  buildTreeClassChooseDropdownField() {
    return Container(
      height: 60,
      child: DropdownSearch(
        mode: Mode.MENU,
        dropdownSearchDecoration: InputDecoration(
            hintText: InStrings.SINIF_SECINIZ,
            border: const OutlineInputBorder()),
      ),
    );
  }

  buildCustomerChooseDropdownField() {
    return Container(
      height: 60,
      child: DropdownSearch(
        items: customerModelValueList.map((e) => e.city).toList(),
        mode: Mode.MENU,
        showSearchBox: true,
        dropdownSearchDecoration: InputDecoration(
            hintText: InStrings.MUSTERI_SECINIZ,
            border: const OutlineInputBorder()),
      ),
    );
  }

  FloatingActionButton buildAddFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () {
        addReceiptDialog(context);
      },
      child: const Icon(Icons.add),
    );
  }

  addReceiptDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Form(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                InStrings.YENI_KALEM_EKLE,
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                buildCustomerChooseDropdownField(),
                partyNumberTextFormField(),
                buildThicknessChooseDropdownField(),
                buildTreeClassChooseDropdownField(),
                widthTextFormField(),
                heightTextFormField(),
                decimeterTextFormField(),
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

  TextFormField widthTextFormField() {
    return TextFormField(
      onChanged: (value) => newWidth = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text(InStrings.EN), border: const OutlineInputBorder()),
    );
  }

  TextFormField heightTextFormField() {
    return TextFormField(
      onChanged: (value) => newHeight = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text(InStrings.BOY), border: const OutlineInputBorder()),
    );
  }

  TextFormField decimeterTextFormField() {
    return TextFormField(
      onChanged: (value) => newDecimeter = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text(InStrings.DM3), border: const OutlineInputBorder()),
    );
  }

  TextFormField partyNumberTextFormField() {
    return TextFormField(
      onChanged: (value) => newPartyNumber = value,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text(InStrings.PARTI_NUMARASI),
          border: const OutlineInputBorder()),
    );
  }

  // Future getData() async {
  //   var firstCustomer =
  //       _firestore.collection("customers").doc("JrTBOsRPk7VuKuHvoDz6");
  //   var response = await firstCustomer.get();
  //   print(response.data());
  //   var data = response.data();
  //   print(data?['company_name']);
  //   temporaryMap = data!.cast();

  //   return data['company_name'];
  // }
}
