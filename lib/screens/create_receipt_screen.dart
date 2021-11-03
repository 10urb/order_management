import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CreateReceiptScreen extends StatelessWidget {
  const CreateReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            bottomNavigationBar: buildBottomNavigationBar(),
            floatingActionButton: buildAddFloatingActionButton(),
            appBar: buildAppbar(),
            body: buildBodyListview()));
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
      title: const Text("Fiş Oluşturma"),
      centerTitle: false,
      actions: [
        ElevatedButton(
            style: const ButtonStyle(),
            onPressed: () {},
            child: const Text("Kaydet\n    ve\nYazdır"))
      ],
    );
  }

  ListView buildBodyListview() {
    return ListView(
      padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 0),
      children: [
        buildCustomerChooseDropdownField(),
        Row(
          children: <Widget>[
            Expanded(
              child: buildPartyNumberTextField(),
            ),
            Expanded(
              child: buildThicknessChooseDropdownField(),
            ),
            Expanded(
              child: buildQualityChooseDropdownField(),
            ),
          ],
        ),
        buildDataTableField(),
      ],
    );
  }

  Container buildPartyNumberTextField() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 30),
      child: TextField(
        decoration: const InputDecoration(hintText: "PartiNumarası"),
      ),
    );
  }

  DataTable buildDataTableField() {
    return DataTable(
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
  }

  Container buildThicknessChooseDropdownField() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      child: DropdownSearch(
        mode: Mode.MENU,
        dropdownSearchDecoration:
            const InputDecoration(hintText: "Kalınlık\nSeçiniz"),
      ),
    );
  }

  Container buildQualityChooseDropdownField() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      child: DropdownSearch(
        mode: Mode.MENU,
        dropdownSearchDecoration:
            const InputDecoration(hintText: "Sınıf\nSeçiniz"),
      ),
    );
  }

  Container buildCustomerChooseDropdownField() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      child: DropdownSearch(
        dropdownSearchDecoration:
            const InputDecoration(hintText: "Müşteri Seçiniz..."),
      ),
    );
  }

  FloatingActionButton buildAddFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
