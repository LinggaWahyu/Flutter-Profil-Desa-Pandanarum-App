import 'package:flutter/foundation.dart';
import 'package:profil_desa_pandanarum/model/GaleriDesa.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<GaleriDesa>> fetchGaleriDesa(http.Client client) async {
  final response = await client.get('http://167.172.70.208:8013/gallery');
  return compute(parseGaleriDesa, response.body);
}

List<GaleriDesa> parseGaleriDesa(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<GaleriDesa>((json) => GaleriDesa.fromJson(json)).toList();
}