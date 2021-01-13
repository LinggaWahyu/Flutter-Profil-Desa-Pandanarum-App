import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/model/KontakKami.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchKontakKami.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:http/http.dart' as http;

class KontakKamiPage extends StatelessWidget {
  static const String routeName = '/kontakKamiPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Kontak Desa Pandanarum'),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<KontakKami>(
          future: fetchKontakKami(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? DetailKontakKami(kontakKami: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class DetailKontakKami extends StatelessWidget {
  final KontakKami kontakKami;

  DetailKontakKami({Key key, @required this.kontakKami}) : super(key: key);

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
                      'Kontak Kami',
                      style: Theme.of(context).textTheme.headline6,
                    ),
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
        kontakKami.description,
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
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAk0tiKGqHgQ5u3sNpEUYpo2FH75WxU5Gxmw&usqp=CAU',
              width: 100,
              height: 200,
            ),
          ),
          bagianJudul,
          bagianDeskripsi,
        ],
      ),
    );
  }
}
