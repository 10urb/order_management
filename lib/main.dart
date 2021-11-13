// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:order_printer_management/helper/manage_strings.dart';
import 'package:order_printer_management/screens/create_receipt_screen.dart';
import 'package:order_printer_management/screens/customer_stock_screen.dart';
import 'package:order_printer_management/screens/definition_screen.dart';
import 'package:order_printer_management/screens/factory_raw_material_stock_screen.dart';
import 'package:order_printer_management/screens/firestore_demo_screen.dart';
import 'package:order_printer_management/screens/forest_management_stock_screen.dart';
import 'package:order_printer_management/screens/home_screen.dart';
import 'package:order_printer_management/screens/login_screen.dart';
import 'package:order_printer_management/screens/printer_connection_screen.dart';
import 'package:order_printer_management/screens/receipt_list_screen.dart';
import 'package:order_printer_management/screens/report_screen.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: HomeScreen(),
//   ));
// }

void main() {
  runApp(
    MaterialApp(
      initialRoute: ManageStrings.LOGIN_SCREEN,
      routes: {
        ManageStrings.HOME_SCREEN: (BuildContext context) => const HomeScreen(),
        ManageStrings.CREATE_RECEIPT_SCREEN: (BuildContext context) =>
            const CreateReceiptScreen(),
        ManageStrings.CUSTOMER_STOCK_SCREEN: (BuildContext context) =>
            const CustomerStockScreen(),
        ManageStrings.DEFINITION_SCREEN: (BuildContext context) =>
            const DefinitionScreen(),
        ManageStrings.FACTORY_RAW_MATERIAL_SCREEN: (BuildContext context) =>
            const FactoryRawMaterialStockScreen(),
        ManageStrings.FIREBASE_DEMO_SCREEN: (BuildContext context) =>
            const FirestoreDemoScreen(),
        ManageStrings.FOREST_MANAGEMENT_STOCK_SCREEN: (BuildContext context) =>
            const ForestManagementStockScreen(),
        ManageStrings.LOGIN_SCREEN: (BuildContext context) =>
            const LoginScreen(),
        ManageStrings.PRINTER_CONNECTION_SCREEN: (BuildContext context) =>
            const PrinterConnectionScreen(),
        ManageStrings.RECEIPT_LIST_SCREEN: (BuildContext context) =>
            const ReceiptListScreen(),
        ManageStrings.REPORT_SCREEN: (BuildContext context) =>
            const ReportScreen(),
      },
    ),
  );
}
