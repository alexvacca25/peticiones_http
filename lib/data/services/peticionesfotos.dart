import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/models/fotos.dart';
import 'package:http/http.dart' as http;

class PeticionesFotos {
  static Future<List<Fotos>> consultasfotos() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");

    final response = await http.get(url);

    return compute(convertirAlista, response.body);
  }

  static List<Fotos> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Fotos>((json) => Fotos.desdeJson(json)).toList();
  }
}
