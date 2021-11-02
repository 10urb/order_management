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
          title: Text("Firma Adı Gelebilir"),
          centerTitle: true,
        ),
        drawer: Drawer(
          elevation: 5,
          child: ListView(
            children: [],
          ),
        ),
        body: Center(
            child: ListView(children: [
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.ac_unit),
              label: Text("Fiş Oluştur")),
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.face),
              label: Text("Fiş Listesi")),
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarms_outlined),
              label: Text("Ayarlar")),
        ])),
      ),
    );
  }
}
