import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/genre.dart';

class LoginProvider {
  // Flutter no coincibe localhost, con lo que he utilizado ngrok
  String _url = 'https://1179-80-29-126-239.ngrok-free.app/api';

  Future<bool> register() async {
    final url = Uri.parse(_url + '/Generes');

    debugPrint('url: $url');

    return true;
  }

  Future<bool> login(String login, String password) async {
    final url = Uri.parse(_url + '/Usuaris/Login');

    Map data = {"user": login, "password": password};

    var body = json.encode(data);

    final response = await http.post(url, body: body, headers: {
      "ngrok-skip-browser-warning": "69420",
      "Content-Type": "application/json"
    });

    debugPrint('post: $url');
    final decodedData = json.decode(response.body);

    return decodedData;
  }
}
