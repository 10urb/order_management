import 'package:flutter/material.dart';

class FirestoreDemoScreen extends StatelessWidget {
  const FirestoreDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Firestore Demo Screen"),
        ),
        body: ListView(
          children: [
            Container(
              child: LinearProgressIndicator(),
              margin: EdgeInsets.all(50),
            ),
            Container(
              child: CircularProgressIndicator(),
              margin: EdgeInsets.all(50),
            ),
            Container(
              child: RefreshProgressIndicator(),
              margin: EdgeInsets.all(50),
            )
          ],
        ),
      ),
    );
  }
}
