import 'package:profil_desa_pandanarum/model/FormDesa.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<FormDesa> fetchForm(http.Client client, String type) async {
  final response = await client.get('http://167.172.70.208:8013/form/$type');
  return FormDesa.fromJson(json.decode(response.body));
}
