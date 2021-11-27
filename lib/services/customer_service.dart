import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:order_printer_management/models/customer_model/customer_model.dart';

class CustomerService {
  CustomerService();

  Future<http.Response> getAll() async {
    const String uri =
        "https://orderandstockmanagement-default-rtdb.firebaseio.com/customers.json";
    var response = await http.get(
      Uri.parse(uri),
    );

    return response;
  }

  Future<http.Response> addPost(CustomerModel customerModel) async {
    const String uri =
        "https://orderandstockmanagement-default-rtdb.firebaseio.com/customers.json";
    var response = await http.post(Uri.parse(uri), body: customerModel);
    return response;
  }

  Future<http.Response> addPut(CustomerModel customerModel) async {
    var toJson = jsonEncode(customerModel.toJson());
    const String uri =
        "https://orderandstockmanagement-default-rtdb.firebaseio.com/customers.json";

    var response = await http.put(Uri.parse(uri), body: toJson);
    return response;
  }
}
