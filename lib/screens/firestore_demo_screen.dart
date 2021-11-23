// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/in_strings.dart';
import 'package:order_printer_management/helper/named_routes.dart';

class FirestoreDemoScreen extends StatefulWidget {
  const FirestoreDemoScreen({Key? key}) : super(key: key);

  @override
  State<FirestoreDemoScreen> createState() => _FirestoreDemoScreenState();
}

class _FirestoreDemoScreenState extends State<FirestoreDemoScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey();

  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getFirstData();
  }

  getFirstData() async {
    var customer = _firestore.collection("customers");
    var response = await customer.get();
    print("onurrr   $response");
    for (var item in response.docs) {
      print(item.data());
    }
  }

  postFirstData() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBar(),
        body: body(),
      ),
    );
  }

  ListView body() {
    return ListView(
      children: [
        Container(
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          margin: const EdgeInsets.all(50),
        ),
        Container(
          child: const LinearProgressIndicator(),
          margin: const EdgeInsets.all(50),
        ),
        Container(
          child: TextFormField(
            controller: _passwordController,
            obscureText: true,
          ),
          margin: const EdgeInsets.all(50),
        ),
        ElevatedButton(
            onPressed: () {
              register();
            },
            child: const Text("Giriş")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, NamedRoutes.CUSTOMER_STOCK_SCREEN);
            },
            child: const Text("sayfa değiştir"))
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("Firestore Demo Screen"),
    );
  }

  void register() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = userCredential.user;
      if (user != null) {
        debugPrint(InStrings.KAYIT_BASARILI);
      } else {
        debugPrint(InStrings.KAYIT_BASARISIZ);
      }
    } catch (e) {
      debugPrint(e.toString());

      debugPrint("Kayıt Başarısız\n\n$e");
    }
  }
}
