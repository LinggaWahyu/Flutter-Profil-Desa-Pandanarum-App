import 'package:flutter/foundation.dart';
import 'package:profil_desa_pandanarum/model/DataStatistik.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<DataStatistik>> fetchDataStatistik(http.Client client, String type) async {
  final response = await client.get('http://167.172.70.208:8013/data-statistik/$type');
  return compute(parseDataStatistik, response.body);
}

List<DataStatistik> parseDataStatistik(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<DataStatistik>((json) => DataStatistik.fromJson(json)).toList();
}