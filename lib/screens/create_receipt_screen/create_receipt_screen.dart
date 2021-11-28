// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:order_printer_management/helper/in_strings.dart';
import 'package:order_printer_management/helper/utilities/toastr.dart';
import 'package:order_printer_management/helper/utilities/validators.dart';
import 'package:order_printer_management/models/customer_model/customer_model.dart';
import 'package:order_printer_management/models/receipt_model/receipt_model.dart';
import 'package:order_printer_management/models/thickness_model/thickness_model.dart';
import 'package:order_printer_management/models/tree_class_model/tree_class_model.dart';
import 'package:order_printer_management/screens/definition_screen/definition_screen.dart';
import 'package:order_printer_management/services/customer_service.dart';
import 'package:order_printer_management/services/receipt_service.dart';
import 'package:order_printer_management/services/thickness_service.dart';
import 'package:order_printer_management/services/tree_class_service.dart';
import 'package:order_printer_management/style/in_style.dart';
part 'create_receipt_screen.data.dart';

class CreateReceiptScreen extends StatefulWidget {
  const CreateReceiptScreen({Key? key}) : super(key: key);

  @override
  State<CreateReceiptScreen> createState() => _CreateReceiptScreenState();
}

class _CreateReceiptScreenState extends State<CreateReceiptScreen> {
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

  Future getThicknesses() async {
    ThicknessService service = ThicknessService();
    var response = await service.getAll();
    if (response.statusCode == 200) {
      var jsonModel = ThicknessModel.fromJson(jsonDecode(response.body));
      for (var item in jsonModel.thicknessValue!) {
        setState(() {
          _thicknessModelList.add(item);
        });
      }
    } else {
      response.statusCode;
    }
  }

  Future getTreeClasses() async {
    TreeClassService service = TreeClassService();
    var response = await service.getAll();
    if (response.statusCode == 200) {
      var jsonModel = TreeClassModel.fromJson(jsonDecode(response.body));
      for (var item in jsonModel.classNumber!) {
        setState(() {
          _treeClassModelList.add(item);
        });
      }
    } else {
      response.statusCode;
    }
  }

  @override
  void initState() {
    getCustomers();
    getThicknesses();
    getTreeClasses();
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

  ListView buildBodyListview(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(MediaQuery.of(context).size.aspectRatio),
      children: [
        buildCustomerChooseDropdownField(),
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
                  rows: _receiptValueList.map((element) {
                    return DataRow(cells: [
                      DataCell(Text(element.thickness.toString().split(".")[0]),
                          showEditIcon: false),
                      DataCell(Text(element.width.toString().split(".")[0]),
                          showEditIcon: true),
                      DataCell(Text(element.height.toString().split(".")[0]),
                          showEditIcon: true),
                      DataCell(Text((element.decimeter! / 1000).toString())),
                    ]);
                  }).toList());
            }),
      ),
    );
  }

  buildThicknessChooseDropdownField() {
    return DropdownSearch(
      validator: (value) => value == null ? InStrings.ZORUNLU_ALAN : null,
      onChanged: (value) => _newThickness = value.toString(),
      items: _thicknessModelList,
      mode: Mode.MENU,
      dropdownSearchDecoration: InputDecoration(
          hintText: InStrings.KALINLIK_SECINIZ,
          border: const OutlineInputBorder()),
    );
  }

  buildTreeClassChooseDropdownField() {
    return DropdownSearch(
      validator: (value) => value == null ? InStrings.ZORUNLU_ALAN : null,
      items: _treeClassModelList,
      mode: Mode.MENU,
      dropdownSearchDecoration: InputDecoration(
          hintText: InStrings.SINIF_SECINIZ,
          border: const OutlineInputBorder()),
    );
  }

  buildCustomerChooseDropdownField() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10,
          vertical: MediaQuery.of(context).size.height / 97),
      height: 60,
      child: DropdownSearch(
        validator: _validator.requiredValidator,
        items: customerModelValueList
            .map((element) => element.companyName.toString())
            .toList(),
        mode: Mode.MENU,
        showSearchBox: true,
        onChanged: (value) => _newCompanyName = value.toString(),
        dropdownSearchDecoration: InputDecoration(
            hintText: InStrings.MUSTERI_SECINIZ,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
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
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                InStrings.YENI_KALEM_EKLE,
                textAlign: TextAlign.center,
              ),
              actionsOverflowButtonSpacing: 5,
              actions: <Widget>[
                partyNumberTextFormField(),
                buildThicknessChooseDropdownField(),
                buildTreeClassChooseDropdownField(),
                widthTextFormField(),
                heightTextFormField(),
                decimeterTextFormField(),
                ElevatedButton(
                  child: Text(InStrings.EKLE),
                  style: InStyle.successElevatedButtonStyle,
                  onPressed: () {
                    setState(() {
                      _newDecimeter = (double.tryParse(_newHeight)! *
                          double.tryParse(_newWidth)! *
                          double.tryParse(_newThickness)!);
                    });
                    var arrayLength = _receiptValueList.length;
                    if (_formKey.currentState!.validate()) {
                      ReceiptValue newReceiptValue = ReceiptValue(
                          height: double.tryParse(_newHeight),
                          decimeter: (_newDecimeter),
                          partyNumber: _newPartyNumber,
                          thickness: double.tryParse(_newThickness),
                          width: double.tryParse(_newWidth),
                          treeClass: _newTreeClass);

                      setState(() {
                        _receiptValueList.add(newReceiptValue);
                        print(_receiptValueList.length);
                      });
                      if (arrayLength > _receiptValueList.length) {
                        Toastr.buildSuccessToast(
                            "Eklendi. Toplam Kalem Sayısı: " +
                                _receiptValueList.length.toString());
                        totalDecimeterMath();
                        dispose();
                      }
                    }
                  },
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

  TextFormField decimeterTextFormField() {
    return TextFormField(
      onTap: () {},
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          label: Text(InStrings.DM3), border: const OutlineInputBorder()),
    );
  }
}
