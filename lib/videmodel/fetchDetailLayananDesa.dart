import 'package:profil_desa_pandanarum/model/DetailLayananDesa.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DetailLayananDesa> fetchDetailLayananDesa(http.Client client, String id) async {
  final response = await client.get('http://167.172.70.208:8013/layanan-desa/$id');
  return DetailLayananDesa.fromJson(json.decode(response.body));
}
