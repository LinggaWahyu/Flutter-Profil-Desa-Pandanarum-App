import 'package:flutter/foundation.dart';
import 'package:profil_desa_pandanarum/model/DataAdministratif.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<DataAdministratif>> fetchDataAdministratif(http.Client client) async {
  final response = await client.get('http://167.172.70.208:8013/data-administrasi');
  return compute(parseDataAdministratif, response.body);
}

List<DataAdministratif> parseDataAdministratif(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<DataAdministratif>((json) => DataAdministratif.fromJson(json)).toList();
}