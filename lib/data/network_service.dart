import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  final baseUrl = "http://10.0.2.2:3000";

  Future<List<dynamic>?> fetchTodos() async {
    try {
      final response = await get(Uri.parse(baseUrl + "/todos"));
      return jsonDecode(response.body) as List;
    } catch (e) {
      return [];
    }
  }

  Future<bool>? patchTodo(Map<String, String> patchObj, int id) async {
    try {
      await patch(Uri.parse(baseUrl + "/todos/$id"), body: patchObj);
      return true;
    } catch (e) {
      return false;
    }
  }
}
