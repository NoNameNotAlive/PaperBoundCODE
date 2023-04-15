import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/store.dart';

class StoreProvider {
  // Flutter no coincibe localhost, con lo que he utilizado ngrok
  String _url = 'https://7ffc-92-178-171-68.ngrok-free.app/api';

  Future<List<Store>> _processResponse(Uri url) async {
    // ngrok tiene una pagina de aviso antes de entrar, para eliminarlo tengo que añadirle un header al Get
    final resp =
        await http.get(url, headers: {"ngrok-skip-browser-warning": "69420"});
    final decodedData = json.decode(resp.body);

    final dataBooks = new Stores.fromJsonList(decodedData);

    return dataBooks.stores;
  }

  Future<List<Store>> getAllStores() async {
    final url = Uri.parse(_url + '/PuntsRecollida');

    debugPrint('url: $url');
    return await _processResponse(url);
  }
}
