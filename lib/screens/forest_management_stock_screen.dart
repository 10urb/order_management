import 'package:flutter/material.dart';

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
          title: const Text("OGM Stoğu"),
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
                ], rows: const [
                  DataRow(cells: [
                    DataCell(Text("Tomruk")),
                    DataCell(Text("Kayın")),
                    DataCell(
                      Text("800"),
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
