import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/genre.dart';

class LoginProvider {
  // Flutter no coincibe localhost, con lo que he utilizado ngrok
  String _url = 'https://7ffc-92-178-171-68.ngrok-free.app/api';

  Future<bool> register(
      String login, String password, String repeatedPsswd) async {
    if (password != repeatedPsswd) {
      return false;
    }
    final url = Uri.parse(_url + '/Usuaris/Register');

    Map data = {"user": login, "password": password};

    var body = json.encode(data);

    final response = await http.post(url, body: body, headers: {
      "ngrok-skip-browser-warning": "69420",
      "Content-Type": "application/json"
    });

    debugPrint('post: $url');
    final decodedData = json.decode(response.body);

    return decodedData != null ? true : false;
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
