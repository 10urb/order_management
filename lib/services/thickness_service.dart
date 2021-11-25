import 'package:http/http.dart' as http;
import 'package:order_printer_management/helper/environment.dart';

class ThicknessService {
  ThicknessService();

  Future<http.Response> getAll() async {
    const String uri = Environment.baseUri + "";
    var response =
        await http.get(Uri.parse(uri), headers: Environment.apiHeader);

    return response;
  }

  Future<http.Response> addPost(Object body) async {
    const String uri = Environment.baseUri + "link gelecek";
    var response = await http.post(Uri.parse(uri),
        body: body, headers: Environment.apiHeader);
    return response;
  }

  Future<http.Response> addPut(Object body) async {
    const String uri = Environment.baseUri + "link gelecek";
    var response = await http.put(Uri.parse(uri),
        headers: Environment.apiHeader, body: body);
    return response;
  }
}
