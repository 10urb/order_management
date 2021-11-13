// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_printer_management/helper/manage_strings.dart';
import 'package:order_printer_management/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';

  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAHXPluq6GtTRPDIHRv5kJPy86uFjp5sO7hg&usqp=CAU"),
        ),
      );
    }

    Widget email() {
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Kullanıcı adı',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          labelText: 'Kullanıcı adı giriniz...',
        ),
      );
    }

    Widget password() {
      return TextFormField(
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Şifre',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          labelText: 'Şifre giriniz...',
        ),
      );
    }

    Widget loginButton(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        // child: RaisedButton(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(24),
        //   ),
        //   onPressed: () {
        //     Navigator.pushNamed(context, "/");
        //   },
        //   padding: const EdgeInsets.all(12),
        //   color: Colors.lightBlueAccent,
        //   child: const Text('Giriş Yap', style: TextStyle(color: Colors.white)),
        // ),
        child: ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, ManageStrings.HOME_SCREEN),
            child: const Text("Giriş Yap")),
      );
    }

    Widget forgotLabel() {
      return TextButton(
        child: const Text(
          'Şifremi unuttum?',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {},
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo(),
              const SizedBox(height: 48.0),
              email(),
              const SizedBox(height: 8.0),
              password(),
              const SizedBox(height: 24.0),
              loginButton(context),
              forgotLabel()
            ],
          ),
        ),
      ),
    );
  }
}
