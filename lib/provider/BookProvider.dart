import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import '../models/book.dart';

class BooksProvider {
  String _url = 'https://localhost:7178/api';

  Future<List<Book>> _processResponse(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final dataBooks = new Books.fromJsonList(decodedData['results']);

    return dataBooks.books;
  }

  Future<List<Book>> getBooks() async {
    final url = Uri.https(_url, '3/person/',
        {'api_key': _apikey, 'language': _language}); // Pelicula
    return await _processResponse(url);
  }

  Future<List<Book>> searchBook(String query) async {
    final url = Uri.https(_url, '3/search/person', {
      'api_key': _apikey,
      'language': _language,
      'query': query
    }); // Pelicula

    return await _processResponse(url);
  }
}
