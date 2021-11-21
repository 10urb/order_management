import 'package:flutter/material.dart';

class InStyle {
  static final ButtonStyle cancelElevatedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.grey,
    minimumSize: const Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );
  static final ButtonStyle successElevatedButtonStyle =
      ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.green[400],
    minimumSize: const Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );
  static elevatedButtonStyleColor(Color primaryColor) {
    return ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: primaryColor,
      minimumSize: const Size(88, 36),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }

  static final ButtonStyle loginElevatedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blue,
    minimumSize: const Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );
  static final ButtonStyle signUpElevatedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blueGrey,
    minimumSize: const Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );

  static final ButtonStyle cancelRedElevatedButtonStyle =
      ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.red.shade400,
    minimumSize: const Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );
  static final ButtonStyle blueElevatedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blue.shade400,
    minimumSize: const Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );
}
