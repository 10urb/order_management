import 'package:flutter/material.dart';

class PrinterConnectionScreen extends StatefulWidget {
  const PrinterConnectionScreen({Key? key}) : super(key: key);

  @override
  _PrinterConnectionScreenState createState() =>
      _PrinterConnectionScreenState();
}

class _PrinterConnectionScreenState extends State<PrinterConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: ListView(
          children: const [
            ListTile(
              title: Text("Yazıcılar listelenecek"),
              trailing: Icon(Icons.bluetooth_connected),
              leading: Icon(Icons.print),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Yazıcı Bağlantısı"),
    );
  }
}
