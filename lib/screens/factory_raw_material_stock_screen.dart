import 'package:flutter/material.dart';

class FactoryRawMaterialStockScreen extends StatefulWidget {
  const FactoryRawMaterialStockScreen({Key? key}) : super(key: key);

  @override
  _FactoryRawMaterialStockScreenState createState() =>
      _FactoryRawMaterialStockScreenState();
}

class _FactoryRawMaterialStockScreenState
    extends State<FactoryRawMaterialStockScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Fabrika Hammadde Stoğu"),
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
                  DataColumn(label: Text("Toplam\nGelen\nM³")),
                  DataColumn(label: Text("Toplam\nGiden\nM³")),
                ], rows: const [
                  DataRow(cells: [
                    DataCell(Text("Tomruk")),
                    DataCell(Text("Kayın")),
                    DataCell(
                      Text("800"),
                    ),
                    DataCell(
                      Text("1250"),
                    ),
                    DataCell(
                      Text("550"),
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
