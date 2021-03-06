import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/model/Organisasi.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchOrganisasi.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:http/http.dart' as http;

class StrukturOrganisasiPage extends StatelessWidget {
 static const String routeName = '/strukturOrganisasiPage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(
        title: Text("Struktur Organisasi"),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<Organisasi>(
          future: fetchOrganisasi(http.Client(), 'strukturOrganisasi'),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? DetailStrukturOrganisasi(strukturOrganisasi: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class DetailStrukturOrganisasi extends StatelessWidget {
  final Organisasi strukturOrganisasi;

  DetailStrukturOrganisasi({Key key, @required this.strukturOrganisasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bagianJudul = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Struktur Organisasi',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    'Desa Pandanarum Kecamatan Sutojayan Kabupaten Blitar',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              '${strukturOrganisasi.img}',
              width: 600,
              height: 310,
            ),
          ),
          bagianJudul,
        ],
      ),
    );
  }
}