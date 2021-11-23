// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/in_strings.dart';
import 'package:order_printer_management/helper/named_routes.dart';
import 'package:order_printer_management/helper/utilities/bluetooth_printer.dart';
import 'package:order_printer_management/helper/utilities/flutter_blue/flutter_blue_demo.dart';
import 'package:order_printer_management/models/tree_species_model.dart';
import 'package:order_printer_management/screens/authentication/register_secreen.dart';
import 'package:order_printer_management/screens/create_receipt_screen.dart';
import 'package:order_printer_management/screens/customer_stock_screen.dart';
import 'package:order_printer_management/screens/definition_screen.dart';
import 'package:order_printer_management/screens/factory_raw_material_stock_screen.dart';
import 'package:order_printer_management/screens/firestore_demo_screen.dart';
import 'package:order_printer_management/screens/forest_management_stock_screen.dart';
import 'package:order_printer_management/screens/home_screen.dart';
import 'package:order_printer_management/screens/authentication/login_screen.dart';
import 'package:order_printer_management/screens/printer_connection_screen.dart';
import 'package:order_printer_management/screens/receipt_list_screen.dart';
import 'package:order_printer_management/screens/report_screen.dart';

// void main() {flutter
//   runApp(const MaterialApp(
//     home: HomeScreen(),
//   ));
// }
FirebaseAuth _auth = FirebaseAuth.instance;
TreeSpeciesModel dedeneme = TreeSpeciesModel.instance();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  _auth = FirebaseAuth.instance;
  print(_auth.currentUser);

  runApp(
    MaterialApp(
      // initialRoute: _auth.currentUser == null
      //     ? NamedRoutes.LOGIN_SCREEN
      //     : NamedRoutes.HOME_SCREEN,
      initialRoute: NamedRoutes.HOME_SCREEN,
      routes: {
        NamedRoutes.HOME_SCREEN: (BuildContext context) => const HomeScreen(),
        NamedRoutes.CREATE_RECEIPT_SCREEN: (BuildContext context) =>
            const CreateReceiptScreen(),
        NamedRoutes.CUSTOMER_STOCK_SCREEN: (BuildContext context) =>
            const CustomerStockScreen(),
        NamedRoutes.DEFINITION_SCREEN: (BuildContext context) =>
            const DefinitionScreen(),
        NamedRoutes.FACTORY_RAW_MATERIAL_SCREEN: (BuildContext context) =>
            const FactoryRawMaterialStockScreen(),
        NamedRoutes.FIREBASE_DEMO_SCREEN: (BuildContext context) =>
            const FirestoreDemoScreen(),
        NamedRoutes.FOREST_MANAGEMENT_STOCK_SCREEN: (BuildContext context) =>
            const ForestManagementStockScreen(),
        NamedRoutes.LOGIN_SCREEN: (BuildContext context) => const LoginScreen(),
        NamedRoutes.PRINTER_CONNECTION_SCREEN: (BuildContext context) =>
            const PrinterConnectionScreen(),
        NamedRoutes.RECEIPT_LIST_SCREEN: (BuildContext context) =>
            const ReceiptListScreen(),
        NamedRoutes.REPORT_SCREEN: (BuildContext context) =>
            const ReportScreen(),
        NamedRoutes.REGISTER_SCREEN: (BuildContext context) =>
            const RegisterScreen(),
        NamedRoutes.BLUETOOTH_PRINTER_SCREEN: (BuildContext context) =>
            BluetoothPrinter(),
      },
    ),
  );
}
