import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/named_routes.dart';
import 'package:order_printer_management/style/in_style.dart';

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
            style: InStyle.elevatedButtonStyleColor(Colors.brown),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(NamedRoutes.CREATE_RECEIPT_SCREEN);
            },
            icon: const Icon(Icons.ac_unit),
            label: const Text("Fiş Oluştur")),
        ElevatedButton.icon(
            style: InStyle.elevatedButtonStyleColor(Colors.brown),
            onPressed: () {
              Navigator.pushNamed(context, NamedRoutes.RECEIPT_LIST_SCREEN);
            },
            icon: const Icon(Icons.face),
            label: const Text("Fiş Listesi")),
        ElevatedButton.icon(
            style: InStyle.elevatedButtonStyleColor(Colors.blue),
            onPressed: () {
              Navigator.pushNamed(
                  context, NamedRoutes.PRINTER_CONNECTION_SCREEN);
            },
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Yazıcıya Bağlan")),
        ElevatedButton.icon(
            style: InStyle.elevatedButtonStyleColor(Colors.blueAccent),
            onPressed: () {
              Navigator.pushNamed(context, NamedRoutes.REPORT_SCREEN);
            },
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Raporlar")),
        // ElevatedButton.icon(
        //     style: InStyle.elevatedButtonStyleColor(Colors.blueGrey),
        //     onPressed: () {
        //       Navigator.pushNamed(
        //           context, InStrings.FACTORY_RAW_MATERIAL_SCREEN);
        //     },
        //     icon: const Icon(Icons.access_alarms_outlined),
        //     label: const Text("Hammadde Girişi")),
        ElevatedButton.icon(
            style: InStyle.elevatedButtonStyleColor(Colors.grey.shade800),
            onPressed: () {
              Navigator.pushNamed(
                  context, NamedRoutes.FACTORY_RAW_MATERIAL_SCREEN);
            },
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
            label: const Text("Odun Ster Ölçü")),
        ElevatedButton.icon(
            style: InStyle.elevatedButtonStyleColor(Colors.lightGreen.shade700),
            onPressed: () {
              Navigator.pushNamed(
                  context, NamedRoutes.FOREST_MANAGEMENT_STOCK_SCREEN);
            },
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("OGM Stok Kontrol")),
        ElevatedButton.icon(
            style: InStyle.elevatedButtonStyleColor(Colors.black38),
            onPressed: () {
              Navigator.pushNamed(context, NamedRoutes.DEFINITION_SCREEN);
            },
            icon: const Icon(Icons.kayaking),
            label: const Text("Tanımlamalar")),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarms_outlined),
            label: const Text("Ayarlar")),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, NamedRoutes.FIREBASE_DEMO_SCREEN);
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
      backgroundColor: Colors.blueGrey,
      title: const Text("Ana Menü"),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, NamedRoutes.LOGIN_SCREEN);
            },
            icon: const Icon(Icons.logout))
      ],
    );
  }
}
