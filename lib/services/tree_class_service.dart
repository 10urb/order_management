import 'dart:convert';

import 'package:order_printer_management/helper/environment.dart';
import 'package:http/http.dart' as http;
import 'package:order_printer_management/models/tree_class_model/tree_class_model.dart';

class TreeClassService {
  TreeClassService();

  Future<http.Response> getAll() async {
    const String uri = Environment.baseUri + "treeClasses.json";
    var response = await http.get(Uri.parse(uri));

    return response;
  }

  Future<http.Response> addPost(TreeClassModel treeClassModel) async {
    var toJson = jsonEncode(treeClassModel.toJson());
    const String uri = Environment.baseUri + "treeClasses.json";
    var response = await http.put(Uri.parse(uri),
        headers: Environment.apiHeader, body: toJson);
    return response;
  }

  Future<http.Response> addPut(TreeClassModel treeClassModel) async {
    var toJson = jsonEncode(treeClassModel.toJson());
    const String uri = Environment.baseUri + "treeClasses.json";
    var response = await http.put(Uri.parse(uri),
        headers: Environment.apiHeader, body: toJson);
    return response;
  }

  // Future<http.Response> updatePatch(TreeClassModel treeClassModel) async {
  // var toJson = jsonEncode(treeClassModel.toJson());
  // const String uri = Environment.baseUri + "treeClasses.json";
  // var response = await http.put(Uri.parse(uri),
  //     headers: Environment.apiHeader, body: toJson);
  // return response;
  // }
}
