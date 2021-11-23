import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothPrinter extends StatefulWidget {
  BluetoothPrinter({Key? key}) : super(key: key);

  @override
  _BluetoothPrinterState createState() => _BluetoothPrinterState();
}

class _BluetoothPrinterState extends State<BluetoothPrinter> {
  FlutterBlue _flutterBlue = FlutterBlue.instance;

  bluetoothScan() async {
    await _flutterBlue.startScan(timeout: Duration(seconds: 20));
    var subscription = _flutterBlue.scanResults.listen((results) {
      for (var scanResult in results) {
        print('${scanResult.device.name} found rssi: ${scanResult.rssi}');
      }
    });
    await _flutterBlue.stopScan();
  }

  @override
  void initState() {
    bluetoothScan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
