import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:order_printer_management/helper/environment.dart';
import 'package:order_printer_management/models/thickness_model/thickness_model.dart';

class ThicknessService {
  ThicknessService();

  Future<http.Response> getAll() async {
    const String uri = Environment.baseUri + "thickness.json";
    var response = await http.get(Uri.parse(uri));

    return response;
  }

  Future<http.Response> addPost(Object body) async {
    const String uri = Environment.baseUri + "link gelecek";
    var response = await http.post(Uri.parse(uri),
        body: body, headers: Environment.apiHeader);
    return response;
  }

  Future<http.Response> addPut(ThicknessModel thicknessModel) async {
    var toJson = jsonEncode(thicknessModel.toJson());

    const String uri = Environment.baseUri + "thickness.json";
    var response = await http.put(Uri.parse(uri),
        headers: Environment.apiHeader, body: toJson);
    return response;
  }

  Future<http.Response> updatePatch(Object value) async {
    var toJson;

    const String uri = Environment.baseUri + "thickness.json";
    var response = await http.patch(Uri.parse(uri),
        headers: Environment.apiHeader, body: toJson);
    return response;
  }
}
