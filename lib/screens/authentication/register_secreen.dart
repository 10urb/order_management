// ignore_for_file: unused_import

import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:order_printer_management/helper/in_strings.dart';
import 'package:order_printer_management/helper/named_routes.dart';
import 'package:order_printer_management/helper/utilities/toastr.dart';
import 'package:order_printer_management/screens/home_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:order_printer_management/style/in_style.dart';

class RegisterScreen extends StatefulWidget {
  static String tag = 'login-page';

  const RegisterScreen({Key? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

EmailValidator emailValidator =
    EmailValidator(errorText: "Hatalı Bilgi Girdiniz");
RequiredValidator requiredValidator =
    RequiredValidator(errorText: "Zorunlu Alan");
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _passwordAgainController = TextEditingController();
final _emailAgainController = TextEditingController();
var _formKey = GlobalKey<FormState>();

late String _message;

FirebaseAuth _auth = FirebaseAuth.instance;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _emailAgainController.dispose();
    _passwordAgainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget email() {
      return TextFormField(
        validator: MultiValidator([emailValidator, requiredValidator]),
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          labelText: 'E-Posta giriniz...',
        ),
      );
    }

    Widget emailAgain() {
      return TextFormField(
        validator: MultiValidator([
          EmailValidator(errorText: "Mail Adresini Kontrol Ediniz"),
          RequiredValidator(errorText: "Zorunlu Alan")
        ]),
        controller: _emailAgainController,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          labelText: 'Tekrar E-Posta giriniz...',
        ),
      );
    }

    Widget password() {
      return TextFormField(
        validator:
            MinLengthValidator(6, errorText: "En Az 6 Karakter Girilmeli"),
        controller: _passwordController,
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

    Widget passwordAgain() {
      return TextFormField(
        validator:
            MinLengthValidator(6, errorText: "En Az 6 Karakter Girilmeli"),
        controller: _passwordAgainController,
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

    Widget signUpButton(BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 5),
        child: ElevatedButton(
            style: InStyle.signUpElevatedButtonStyle,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Toastr.buildToast(_message, Colors.green);
                Navigator.pushReplacementNamed(
                    context, NamedRoutes.HOME_SCREEN);
              }
            },
            child: Text(InStrings.GONDER)),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(InStrings.KAYIT_OL),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.all(9),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                const SizedBox(height: 48.0),
                email(),
                const SizedBox(height: 8.0),
                emailAgain(),
                const SizedBox(height: 8.0),
                password(),
                const SizedBox(height: 8.0),
                passwordAgain(),
                const SizedBox(height: 24.0),

                signUpButton(context),
                //loginWithGoogleButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = userCredential.user;
      if (user != null) {
        debugPrint(_message = InStrings.KAYIT_BASARILI);
      } else {
        debugPrint(InStrings.KAYIT_BASARISIZ);
      }
    } catch (e) {
      debugPrint(e.toString());

      debugPrint("Kayıt Başarısız\n\n$e");
    }
  }

  void signIn() async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final User? user = userCredential.user;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Hoşgeldin ${user?.email}")));

      debugPrint("Hoşgeldin ${user?.email}");
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message.toString());

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // _signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //     final UserCredential userCredential =
  //         await _auth.signInWithCredential(credential);
  //     final User? user = userCredential.user;

  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Hoşgeldin ${user?.displayName}")));
  //     print("Hoşgeldin ${user?.displayName.toString()}");
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(e.code.toString())));
  //     print(e.code);
  //   } catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(e.toString())));
  //     print(e.toString());
  //   }
  // }
}
