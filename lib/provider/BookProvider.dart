import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/book.dart';

class BookProvider {
  // Flutter no coincibe localhost, con lo que he utilizado ngrok
  String _url = 'https://7ffc-92-178-171-68.ngrok-free.app/api';

  Future<List<Book>> _processResponse(Uri url, String title) async {
    // ngrok tiene una pagina de aviso antes de entrar, para eliminarlo tengo que añadirle un header al Get
    final resp =
        await http.get(url, headers: {"ngrok-skip-browser-warning": "69420"});
    final decodedData = json.decode(resp.body);

    final dataBooks = new Books.fromJsonList(decodedData);

    return dataBooks.books;
  }

  Future<List<Book>> getBooksByGenre(String genre, String title) async {
    final url;

    if (title == "") {
      url = Uri.parse(_url + '/Llibres/' + genre);
    } else {
      url = Uri.parse(_url +
          '/Llibres/getByBookName?genreName=' +
          genre +
          '&bookName=' +
          title);
    }

    debugPrint('url: $url');

    final resp =
        await http.get(url, headers: {"ngrok-skip-browser-warning": "69420"});
    final decodedData = json.decode(resp.body);

    final dataBooks = new Books.fromJsonList(decodedData);

    return dataBooks.books;
  }
}
