import 'package:profil_desa_pandanarum/model/Organisasi.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Organisasi> fetchOrganisasi(http.Client client, String organisasi) async {
  final response = await client.get('http://167.172.70.208:8013/organisasi/$organisasi');
  return Organisasi.fromJson(json.decode(response.body));
}
