import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/models/user.dart';
import 'package:http/http.dart' as http;

class PeticionesUser {
  static Future<List<User>> validaruser(String u, String p) async {
    var url = Uri.parse(
        "https://desarolloweb2021a.000webhostapp.com/APIMOVIL/listaruser.php");

    final response = await http.post(url, body: {'user': u, 'pass': p});

    return compute(convertirAlista, response.body);
  }

  static List<User> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }
}
