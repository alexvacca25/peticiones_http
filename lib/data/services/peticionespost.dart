import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:peticiones_http/domain/models/post.dart';
import 'package:http/http.dart' as http;

class PeticionesPost {
  static Future<List<Post>> consultaspost() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    final response = await http.get(url);

    return compute(convertirAlista, response.body);
  }

  static List<Post> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<Post>((json) => Post.desdeJson(json)).toList();
  }
}
