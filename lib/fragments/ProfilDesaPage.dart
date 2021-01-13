import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/model/ProfilDesa.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchProfilDesa.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:http/http.dart' as http;

class ProfilDesaPage extends StatelessWidget {
 static const String routeName = '/profilDesaPage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(
        title: Text("Profil Desa Pandanarum"),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<ProfilDesa>(
          future: fetchProfilDesa(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? DetailProfilDesa(profilDesa: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class DetailProfilDesa extends StatelessWidget {
  final ProfilDesa profilDesa;

  DetailProfilDesa({Key key, @required this.profilDesa}) : super(key: key);

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
                      'Profil Desa Pandanarum',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    'Kecamatan Sutojayan Kabupaten Blitar',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Widget bagianDeskripsi = Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        profilDesa.description,
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              'https://openstreetmap.id/apik-jatim/media/uploads/94_1_1567170925.jpg',
              width: 600,
              height: 310,
            ),
          ),
          bagianJudul,
          bagianDeskripsi,
        ],
      ),
    );
  }
}