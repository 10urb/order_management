// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/in_strings.dart';
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

// void main() {
//   runApp(const MaterialApp(
//     home: HomeScreen(),
//   ));
// }
FirebaseAuth _auth = FirebaseAuth.instance;
TreeSpeciesModel dedeneme = TreeSpeciesModel.instance();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: _auth.currentUser == null
          ? InStrings.LOGIN_SCREEN
          : InStrings.FACTORY_RAW_MATERIAL_SCREEN,
      routes: {
        InStrings.HOME_SCREEN: (BuildContext context) => const HomeScreen(),
        InStrings.CREATE_RECEIPT_SCREEN: (BuildContext context) =>
            const CreateReceiptScreen(),
        InStrings.CUSTOMER_STOCK_SCREEN: (BuildContext context) =>
            const CustomerStockScreen(),
        InStrings.DEFINITION_SCREEN: (BuildContext context) =>
            const DefinitionScreen(),
        InStrings.FACTORY_RAW_MATERIAL_SCREEN: (BuildContext context) =>
            const FactoryRawMaterialStockScreen(),
        InStrings.FIREBASE_DEMO_SCREEN: (BuildContext context) =>
            const FirestoreDemoScreen(),
        InStrings.FOREST_MANAGEMENT_STOCK_SCREEN: (BuildContext context) =>
            const ForestManagementStockScreen(),
        InStrings.LOGIN_SCREEN: (BuildContext context) => const LoginScreen(),
        InStrings.PRINTER_CONNECTION_SCREEN: (BuildContext context) =>
            const PrinterConnectionScreen(),
        InStrings.RECEIPT_LIST_SCREEN: (BuildContext context) =>
            const ReceiptListScreen(),
        InStrings.REPORT_SCREEN: (BuildContext context) => const ReportScreen(),
        InStrings.REGISTER_SCREEN: (BuildContext context) =>
            const RegisterScreen(),
      },
    ),
  );
}
