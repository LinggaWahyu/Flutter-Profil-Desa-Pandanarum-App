import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:profil_desa_pandanarum/model/DetailArtikel.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchDetailArtikel.dart';
import 'package:http/http.dart' as http;

class DetailArtikelItem extends StatelessWidget {
  final String id;

  DetailArtikelItem({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<DetailArtikel>(
              future: fetchArtikel(http.Client(), id),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? DetailArtikelPage(detailArtikel: snapshot.data)
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
    );
  }
}

class DetailArtikelPage extends StatelessWidget {
  final DetailArtikel detailArtikel;

  DetailArtikelPage({Key key, @required this.detailArtikel}) : super(key: key);

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
                      detailArtikel.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    detailArtikel.dateTime,
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
        detailArtikel.description,
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(detailArtikel.title),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              '${detailArtikel.img}',
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
