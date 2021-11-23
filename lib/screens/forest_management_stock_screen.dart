import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/in_strings.dart';
import 'package:order_printer_management/helper/utilities/validators.dart';
import 'package:order_printer_management/style/in_style.dart';

class ForestManagementStockScreen extends StatefulWidget {
  const ForestManagementStockScreen({Key? key}) : super(key: key);

  @override
  _ForestManagementStockScreenState createState() =>
      _ForestManagementStockScreenState();
}

class _ForestManagementStockScreenState
    extends State<ForestManagementStockScreen> {
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _inStockController = TextEditingController();
  final TextEditingController _treeSpecieController = TextEditingController();
  TextEditingController productTypeController = TextEditingController();
  final Validators _validators = Validators();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen.shade700,
          title: Text(InStrings.OGM_STOGU),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            buildAddFromForest();
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.orange,
        ),
        body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(columns: const [
                  DataColumn(label: Text("Ürün\nCinsi")),
                  DataColumn(label: Text("Ağaç\nCinsi")),
                  DataColumn(label: Text("Stokta\nVar Olan\nM³")),
                  DataColumn(label: Text("... Tarihi")),
                ], rows: const [
                  DataRow(cells: [
                    DataCell(Text("Tomruk")),
                    DataCell(Text("Kayın")),
                    DataCell(
                      Text("800"),
                    ),
                    DataCell(
                      Text("20.12.2021"),
                    ),
                  ])
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildAddFromForest() {
    return showDialog(
      context: context,
      builder: (context) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AlertDialog(
              scrollable: true,
              insetPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20),
              backgroundColor: Colors.white,
              title: Text(
                InStrings.URUN_EKLE,
                textAlign: TextAlign.center,
              ),
              actions: [
                TextFormField(
                  validator: _validators.requiredValidator,
                  controller: productTypeController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      label: Text(InStrings.URUN_TIPI),
                      border: const OutlineInputBorder()),
                ),
                TextFormField(
                    validator: _validators.requiredValidator,
                    controller: _treeSpecieController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        label: Text(InStrings.AGAC_CINSI),
                        border: const OutlineInputBorder())),
                TextFormField(
                  validator: _validators.requiredValidator,
                  controller: _inStockController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text(InStrings.STOK_GIRIS_MIKTARI),
                      border: const OutlineInputBorder()),
                ),
                DateTimeFormField(
                    initialValue: DateTime.now(),
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: Text(InStrings.TARIH)),
                    initialDate: DateTime.now(),
                    mode: DateTimeFieldPickerMode.date,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100)),
                TextFormField(
                  controller: _noteController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      label: Text(InStrings.EK_BILGI),
                      border: const OutlineInputBorder()),
                ),
                ElevatedButton(
                  child: Text(InStrings.EKLE),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
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
}
