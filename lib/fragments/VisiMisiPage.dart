import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/model/Organisasi.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchOrganisasi.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:http/http.dart' as http;

class VisiMisiPage extends StatelessWidget {
 static const String routeName = '/visiMisiPage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(
        title: Text("Visi dan Misi"),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<Organisasi>(
          future: fetchOrganisasi(http.Client(), 'visiMisi'),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? DetailVisiMisi(visiMisi: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class DetailVisiMisi extends StatelessWidget {
  final Organisasi visiMisi;

  DetailVisiMisi({Key key, @required this.visiMisi}) : super(key: key);

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
                      'Visi dan Misi',
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

    Widget bagianDeskripsi = Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        visiMisi.img,
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
              'http://bappeda.pidiekab.go.id/thumbnail/700x0/media/bappeda.pidiekab.go.id/2019.10/visi-dan-misi-bappeda.png',
              width: 600,
              height: 310,
            ),
          ),
          bagianJudul,
          bagianDeskripsi
        ],
      ),
    );
  }
}