// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/utilities/toastr.dart';

class ReceiptListScreen extends StatefulWidget {
  const ReceiptListScreen({Key? key}) : super(key: key);

  @override
  _ReceiptListScreenState createState() => _ReceiptListScreenState();
}

class _ReceiptListScreenState extends State<ReceiptListScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  ListView buildBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        buildFirmNameTextField(),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                showCheckboxColumn: true,
                checkboxHorizontalMargin: 10,
                columns: const [
                  // DataColumn(label: Text("Seçim\nAlanı")),
                  DataColumn(label: Text("Parti\nNo")),
                  DataColumn(label: Text("Durumu")),
                  DataColumn(label: Text("Sınıf")),
                  DataColumn(label: Text("Kalınlık\n(Cm)")),
                  DataColumn(label: Text("Tarih")),
                  DataColumn(label: Text("Hacim\n(Dm³)")),
                  DataColumn(label: Text("Prizma\n(%)")),
                ],
                rows: [
                  DataRow(selected: true, cells: [
                    // DataCell(Checkbox(
                    //   value: isSelected,
                    //   onChanged: (value) {},
                    // )),
                    DataCell(Text("860")),
                    DataCell(
                      Text("Sahada"),
                      onLongPress: () {
                        Toastr.buildToast("test", Colors.green);
                      },
                    ),
                    DataCell(Text("6")),
                    DataCell(Text("15.5")),
                    DataCell(Text("21.10.2021")),
                    DataCell(Text("2.413")),
                    DataCell(Text("100")),
                  ]),
                ]),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      actions: [
        PopupMenuButton(
            icon: const Icon(Icons.menu_outlined),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    height: 50,
                    child: const Text('Test '),
                    onTap: () {},
                  ),
                ])
      ],
      title: const Text("Fiş Listesi"),
    );
  }

  Container buildFirmNameTextField() {
    return Container(
      margin: const EdgeInsets.only(left: 5, bottom: 0, right: 5, top: 0),
      child: const TextField(
        readOnly: true,
        decoration: InputDecoration(hintText: "Firma Adı Gelecek"),
      ),
    );
  }
}
