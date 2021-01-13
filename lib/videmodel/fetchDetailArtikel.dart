import 'package:profil_desa_pandanarum/model/DetailArtikel.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DetailArtikel> fetchArtikel(http.Client client, String id) async {
  final response = await client.get('http://167.172.70.208:8013/artikel/$id');
  return DetailArtikel.fromJson(json.decode(response.body));
}
