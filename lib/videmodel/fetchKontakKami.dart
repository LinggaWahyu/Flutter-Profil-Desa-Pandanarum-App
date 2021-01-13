import 'package:profil_desa_pandanarum/model/KontakKami.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<KontakKami> fetchKontakKami(http.Client client) async {
  final response = await client.get('http://167.172.70.208:8013/kontak');
  return KontakKami.fromJson(json.decode(response.body));
}
