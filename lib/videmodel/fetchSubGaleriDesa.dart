import 'package:flutter/foundation.dart';
import 'package:profil_desa_pandanarum/model/SubGaleriDesa.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<SubGaleriDesa>> fetchSubGaleriDesa(http.Client client, String id) async {
  final response = await client.get('http://167.172.70.208:8013/sub-gallery/$id');
  return compute(parseSubGaleriDesa, response.body);
}

List<SubGaleriDesa> parseSubGaleriDesa(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<SubGaleriDesa>((json) => SubGaleriDesa.fromJson(json)).toList();
}