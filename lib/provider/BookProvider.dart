import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/book.dart';

class BookProvider {
  String _url = 'https://localhost:7178/api';

  Future<List<Book>> _processResponse(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final dataBooks = new Books.fromJsonList(decodedData);

    return dataBooks.books;
  }

  Future<List<Book>> getBooksByGenre(String genre) async {
    final url = Uri.https(_url, '/Llibres/' + genre);

    debugPrint('movieTitle: $url');
    return await _processResponse(url);
  }
}
