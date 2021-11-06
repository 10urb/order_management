import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ana Menü"),
          centerTitle: true,
        ),
        drawer: Drawer(
          elevation: 5,
          child: ListView(
            children: const [],
          ),
        ),
        body: Center(
            child: ListView(
          children: [
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit),
                label: const Text("Fiş Oluştur")),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.face),
                label: const Text("Fiş Listesi")),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarms_outlined),
                label: const Text("Yazıcıya Bağlan")),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarms_outlined),
                label: const Text("Raporlar")),
            ElevatedButton.icon(
                onPressed: () {},
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
                onPressed: () {},
                icon: const Icon(Icons.kayaking),
                label: const Text("Tanımlamalar")),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarms_outlined),
                label: const Text("Ayarlar")),
          ],
          padding: const EdgeInsets.all(30),
        )),
      ),
    );
  }
}
