import 'package:flutter/material.dart';

class DefinitionScreen extends StatefulWidget {
  const DefinitionScreen({Key? key}) : super(key: key);

  @override
  _DefinitionScreenState createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: ListView(
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text("Müşteri Ekleme")),
            ElevatedButton(
                onPressed: () {}, child: const Text("... Tanımlama")),
            ElevatedButton(
                onPressed: () {}, child: const Text("... Tanımlama")),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Tanımlamalar"),
    );
  }
}
