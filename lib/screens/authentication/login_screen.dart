// ignore_for_file: unused_import, avoid_print

import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:order_printer_management/helper/in_strings.dart';
import 'package:order_printer_management/helper/utilities/toastr.dart';
import 'package:order_printer_management/helper/utilities/validators.dart';
import 'package:order_printer_management/screens/authentication/register_secreen.dart';
import 'package:order_printer_management/screens/home_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:order_printer_management/style/in_style.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';

  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Validators validators = Validators();

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
var _formKey = GlobalKey<FormState>();

FirebaseAuth _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(35),
            child: Center(
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
                  forgotButton(),
                  signUpButton(context),
                  //loginWithGoogleButton(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget email() {
    return TextFormField(
      validator: MultiValidator(
          [validators.emailValidator, validators.requiredValidator]),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        labelText: InStrings.E_POSTA_ADRESI_GIRINIZ,
      ),
    );
  }

  Widget password() {
    return TextFormField(
      validator: MultiValidator([
        validators.requiredValidator,
        MinLengthValidator(6, errorText: InStrings.EN_AZ_6_KARAKTER_OLMALI)
      ]),
      controller: _passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        labelText: InStrings.SIFRE_GIRINIZ,
      ),
    );
  }

  Widget signUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: ElevatedButton(
          style: InStyle.signUpElevatedButtonStyle,
          onPressed: () {
            Navigator.pushNamed(context, InStrings.REGISTER_SCREEN);
          },
          child: Text(InStrings.KAYIT_OL)),
    );
  }

  Widget loginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
          style: InStyle.loginElevatedButtonStyle,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              signIn();
              print(_auth.currentUser);
              Navigator.pushReplacementNamed(context, InStrings.HOME_SCREEN);
            }
          },
          child: Text(InStrings.GIRIS_YAP)),
    );
  }

  // Widget loginWithGoogleButton(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 16.0),
  //     child: ElevatedButton(
  //         onPressed: () {
  //           //_signInWithGoogle();
  //         },
  //         child: const Text("Google ile Giriş Yap")),
  //   );
  // }

  Widget forgotButton() {
    return TextButton(
      child: Text(
        InStrings.SIFREMI_UNUTTUM,
        style: const TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
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
        debugPrint(InStrings.KAYIT_BASARILI);
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
