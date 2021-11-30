import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:order_printer_management/helper/environment.dart';
import 'package:order_printer_management/models/receipt_model/receipt_model.dart';

class ReceiptService {
  dynamic token;
  ReceiptService({this.token});

  Future<http.Response> getAll() async {
    const String uri = Environment.baseUri + "receipts.json";
    var response = await http.get(Uri.parse(uri));

    return response;
  }

  Future<http.Response> addPost(ReceiptModel receiptModel) async {
    var toJson = jsonEncode(receiptModel.toJson());
    const String uri = Environment.baseUri + "receipts.json";
    var response = await http.post(Uri.parse(uri), body: toJson);
    return response;
  }

  Future<http.Response> addPut(ReceiptModel receiptModel) async {
    var toJson = jsonEncode(receiptModel.toJson());
    const String uri = Environment.baseUri + "receipts.json";
    var response = await http.put(Uri.parse(uri), body: toJson);
    return response;
  }
}
