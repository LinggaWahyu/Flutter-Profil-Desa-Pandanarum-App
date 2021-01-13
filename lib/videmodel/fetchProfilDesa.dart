import 'package:profil_desa_pandanarum/model/ProfilDesa.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<ProfilDesa> fetchProfilDesa(http.Client client) async {
  final response = await client.get('http://167.172.70.208:8013/profile-desa');
  return ProfilDesa.fromJson(json.decode(response.body));
}
