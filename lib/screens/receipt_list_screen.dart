import 'package:flutter/material.dart';

class ReceiptListScreen extends StatefulWidget {
  const ReceiptListScreen({Key? key}) : super(key: key);

  @override
  _ReceiptListScreenState createState() => _ReceiptListScreenState();
}

class _ReceiptListScreenState extends State<ReceiptListScreen> {
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
            child: DataTable(showCheckboxColumn: true, columns: const [
              DataColumn(label: Text("Parti\nNo")),
              DataColumn(label: Text("Durumu")),
              DataColumn(label: Text("Sınıf")),
              DataColumn(label: Text("Kalınlık\n(Cm)")),
              DataColumn(label: Text("Tarih")),
              DataColumn(label: Text("Hacim\n(Dm³)")),
              DataColumn(label: Text("Prizma\n(%)")),
            ], rows: const [
              DataRow(cells: [
                DataCell(Text("860")),
                DataCell(Text("Sahada")),
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
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
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
