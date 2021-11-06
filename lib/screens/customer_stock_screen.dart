import 'package:flutter/material.dart';

class CustomerStockScreen extends StatefulWidget {
  const CustomerStockScreen({Key? key}) : super(key: key);

  @override
  _CustomerStockScreenState createState() => _CustomerStockScreenState();
}

class _CustomerStockScreenState extends State<CustomerStockScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Müşteri Stok Takibi"),
      ),
    ));
  }
}
