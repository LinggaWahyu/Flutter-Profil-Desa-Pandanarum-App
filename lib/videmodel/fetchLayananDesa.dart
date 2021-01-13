import 'package:flutter/foundation.dart';
import 'package:profil_desa_pandanarum/model/LayananDesa.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<LayananDesa>> fetchLayananDesa(http.Client client) async {
  final response = await client.get('http://167.172.70.208:8013/layanan-desa');
  return compute(parseLayananDesa, response.body);
}

List<LayananDesa> parseLayananDesa(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<LayananDesa>((json) => LayananDesa.fromJson(json)).toList();
}