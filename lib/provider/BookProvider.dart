import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/book.dart';

class BookProvider {
  // Flutter no coincibe localhost, con lo que he utilizado ngrok
  String _url = 'https://1179-80-29-126-239.ngrok-free.app/api';

  Future<List<Book>> _processResponse(Uri url) async {
    // ngrok tiene una pagina de aviso antes de entrar, para eliminarlo tengo que añadirle un header al Get
    final resp =
        await http.get(url, headers: {"ngrok-skip-browser-warning": "69420"});
    final decodedData = json.decode(resp.body);

    final dataBooks = new Books.fromJsonList(decodedData);

    return dataBooks.books;
  }

  Future<List<Book>> getBooksByGenre(String genre) async {
    final url = Uri.parse(_url + '/Llibres/' + genre);

    debugPrint('url: $url');
    return await _processResponse(url);
  }
}
