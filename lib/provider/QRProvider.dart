import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';

class QrProvider {
  // Flutter no concibe localhost, con lo que he utilizado ngrok
  String _url = 'https://7ffc-92-178-171-68.ngrok-free.app/api';

  Future<String> createQr(int book, int store) async {
    final url = Uri.parse(_url + '/Qrs');

    Map data = {"idLlibre": book, "idPuntRecollida": store};

    var body = json.encode(data);

    final response = await http.post(url, body: body, headers: {
      "ngrok-skip-browser-warning": "69420",
      "Content-Type": "application/json"
    });

    debugPrint('post: $url');

    return response.body;
  }
}
