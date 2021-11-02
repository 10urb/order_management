import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CreateReceiptScreen extends StatelessWidget {
  const CreateReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            floatingActionButton: buildAddFloatingActionButton(),
            appBar: AppBar(
              title: Text("Fiş Oluşturma"),
              centerTitle: false,
              actions: [
                ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {},
                    child: Text("Kaydet ve Yazdır"))
              ],
            ),
            body: ListView(
              padding:
                  const EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 0),
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 5, top: 10),
                  child: DropdownSearch(
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "Müşteri Seçiniz..."),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 5, top: 10),
                  child: DropdownSearch(
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "Kalınlık Seçiniz"),
                  ),
                ),
                DataTable(
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
                        DataCell(Text("Kalınlık 1")),
                        DataCell(Text("En 2")),
                        DataCell(Text("Boy 3")),
                        DataCell(Text("desimetre 4")),
                      ]),
                    ])
              ],
            )));
  }

  FloatingActionButton buildAddFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }
}
