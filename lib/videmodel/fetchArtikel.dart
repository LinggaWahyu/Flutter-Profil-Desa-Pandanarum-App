import 'package:flutter/foundation.dart';
import 'package:profil_desa_pandanarum/model/Artikel.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Artikel>> fetchArtikel(http.Client client) async {
  final response = await client.get('http://167.172.70.208:8013/artikel');
  return compute(parseArtikel, response.body);
}

List<Artikel> parseArtikel(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<Artikel>((json) => Artikel.fromJson(json)).toList();
}