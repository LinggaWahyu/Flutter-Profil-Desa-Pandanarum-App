import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:profil_desa_pandanarum/model/DetailLayananDesa.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchDetailLayananDesa.dart';
import 'package:http/http.dart' as http;

class DetailLayananDesaItem extends StatelessWidget {
  final String id;

  DetailLayananDesaItem({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<DetailLayananDesa>(
              future: fetchDetailLayananDesa(http.Client(), id),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? DetailLayananDesaPage(detailLayananDesa: snapshot.data)
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
    );
  }
}

class DetailLayananDesaPage extends StatelessWidget {
  final DetailLayananDesa detailLayananDesa;

  DetailLayananDesaPage({Key key, @required this.detailLayananDesa}) : super(key: key);

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
                      detailLayananDesa.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    detailLayananDesa.dateTime,
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
        detailLayananDesa.description,
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(detailLayananDesa.title),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              '${detailLayananDesa.img}',
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
