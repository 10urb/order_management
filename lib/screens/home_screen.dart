import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/in_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBar(),
        drawer: drawer(),
        body: body(),
      ),
    );
  }

  Center body() {
    return Center(
        child: ListView(
      children: [
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, InStrings.CREATE_RECEIPT_SCREEN);
            },
            icon: const Icon(Icons.ac_unit),
            label: const Text("Fiş Oluştur")),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, InStrings.RECEIPT_LIST_SCREEN);
            },
            icon: const Icon(Icons.face),
            label: const Text("Fiş Listesi")),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, InStrings.PRINTER_CONNECTION_SCREEN);
            },
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Yazıcıya Bağlan")),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, InStrings.REPORT_SCREEN);
            },
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Raporlar")),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(
                  context, InStrings.FACTORY_RAW_MATERIAL_SCREEN);
            },
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Hammadde Girişi")),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Fabrika Stok")),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Dikili İşçilik")),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Orman Stok Kutur")),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Odur Ster Ölçü")),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("OGM Stok Kontrol")),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, InStrings.DEFINITION_SCREEN);
            },
            icon: const Icon(Icons.kayaking),
            label: const Text("Tanımlamalar")),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Ayarlar")),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, InStrings.FIREBASE_DEMO_SCREEN);
            },
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("FireStoreDemo")),
      ],
      padding: const EdgeInsets.all(30),
    ));
  }

  Drawer drawer() {
    return Drawer(
      elevation: 5,
      child: ListView(
        children: const [],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("Ana Menü"),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, InStrings.LOGIN_SCREEN);
            },
            icon: const Icon(Icons.logout))
      ],
    );
  }
}
