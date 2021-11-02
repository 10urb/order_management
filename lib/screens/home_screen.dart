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
          title: const Text("Firma Adı Gelebilir"),
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
