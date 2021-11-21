import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/in_strings.dart';

class ForestManagementStockScreen extends StatefulWidget {
  const ForestManagementStockScreen({Key? key}) : super(key: key);

  @override
  _ForestManagementStockScreenState createState() =>
      _ForestManagementStockScreenState();
}

class _ForestManagementStockScreenState
    extends State<ForestManagementStockScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen.shade700,
          title: Text(InStrings.OGM_STOGU),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
}
