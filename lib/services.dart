import 'dart:convert';
import 'package:http/http.dart' as http;

import 'book.dart';

Future getBooks() async {
  const String API_KEY = 'zuwSLbU4yB7m0Qc17dZ5CGzSGT1Z7AuG';
  var response = await http.get(
      'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=$API_KEY');
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    return BookList.fromJson(jsonResponse['results']['books']);
  } else {
    print("Unexpected error occurred.");
  }
}
