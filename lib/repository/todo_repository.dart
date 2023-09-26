import 'dart:convert';

import 'package:bloc_tutorial/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  Future<List<ToDo>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) {
        return ToDo.fromMap(e);
      }).toList();
      return result;
    } else {
      throw "something went wrong code ${response.statusCode}";
    }
  }
}
